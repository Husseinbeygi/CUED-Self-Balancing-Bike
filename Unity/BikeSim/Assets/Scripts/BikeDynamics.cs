using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BikeDynamics : MonoBehaviour {

    public GameObject Bike;
    public GameObject Fork;
    public GameObject FrontWheel, RearWheel;

    // GUI
    public Text txtPhi, txtDelta, txtPhiDot, txtDeltaDot, txtVelocity, txtYaw, txtXPos, txtYPos;
    public InputField txtMagnitude;
    public Button btnLeanImpulse, btnLeanStep, btnLeanZero;
    public Button btnSteerImpulse, btnSteerStep, btnSteerZero;
    public Scrollbar scrVelocity, scrNoise, scrOutputLimit, scrDelay;
    
    private float[,] M = new float[,] { {80.8121f, 2.3234f}, {2.3234f, 0.3013f} };
    private float[,] C_1 = new float[,] { {0, 33.7739f}, {-0.8482f, 1.707f} };
    private float[,] K_0 = new float[,] { {-794.1195f, -25.7391f}, {-25.7391f, -8.1394f} };
    private float[,] K_2 = new float[,] { {0, 76.4062f }, {0, 2.6756f } };

    private float C11, C12, C21, C22;
    private float K011, K012, K021, K022;
    private float K211, K212, K221, K222;

    private float k0, k1, k2, k3, k4;

    private float wheel_base = 1.02f;

    // State
    // Phi = Lean angle, Delta = Steer angle, v = Forward speed, psi = Yaw angle (relative to x-axis)
    float phi, delta, phidot, deltadot, v, psi, x, y;

    // Control inputs
    float Tphi, Tdelta;
    float Tphi_controller, Tdelta_controller;
    float Tphi_external, Tdelta_external;
    float[] u_ = new float[] { 0, 0 };
    float[] y_ = new float[] { 0, 0 };
    bool leanImp, steerImp;

    float sensorNoise = 0;
    float controller_out_limit = 10.0f;
    float tau_lag = 0;

    void Start() {

        // Compute coefficients
        C11 = C_1[0, 0]; C12 = C_1[0, 1]; C21 = C_1[1, 0]; C22 = C_1[1, 1];
        K011 = K_0[0, 0]; K012 = K_0[0, 1]; K021 = K_0[1, 0]; K022 = K_0[1, 1];
        K211 = K_2[0, 0]; K212 = K_2[0, 1]; K221 = K_2[1, 0]; K222 = K_2[1, 1];

        k0 = M[0, 0] * M[1, 1] - M[0, 1] * M[1, 0];
        k1 = M[0, 1] / k0;
        k2 = M[1, 1] / k0;
        k3 = M[1, 0] / k0;
        k4 = M[0, 0] / k0;

        // Initialise GUI handlers
        btnLeanImpulse.onClick.AddListener(delegate { handleControlInputs(0); });
        btnLeanStep.onClick.AddListener(delegate { handleControlInputs(1); });
        btnLeanZero.onClick.AddListener(delegate { handleControlInputs(2); });
        btnSteerImpulse.onClick.AddListener(delegate { handleControlInputs(3); });
        btnSteerStep.onClick.AddListener(delegate { handleControlInputs(4); });
        btnSteerZero.onClick.AddListener(delegate { handleControlInputs(5); });
        scrVelocity.onValueChanged.AddListener(delegate { changeVelocity(); });
        scrNoise.onValueChanged.AddListener(delegate { changeNoise(); });
        scrOutputLimit.onValueChanged.AddListener(delegate { changeOutputLimit(); });
        scrDelay.onValueChanged.AddListener(delegate { changeDelay(); });
        leanImp = steerImp = false;
        txtMagnitude.text = "1.0";

        // Reset states
        phi = delta = phidot = deltadot = v = psi = x = y = 0;

        Tphi_controller = 0; Tdelta_controller = 0;
        Tphi_external   = 0; Tdelta_external   = 0;

        // Set initial velocity
        v = 5f;

    }

    void Update() {

        // Sampling time
        float dt = Time.deltaTime;

        // Controller outputs
        Tphi_controller = 0;
        Tdelta_controller = -335.7257f * (phi + Random.Range(-sensorNoise, sensorNoise)) + 46.7495f * (delta + Random.Range(-sensorNoise, sensorNoise)) 
                            - 68.901f * (phidot + Random.Range(-sensorNoise, sensorNoise)) + 5.1164f * (deltadot + Random.Range(-sensorNoise, sensorNoise));

        // Limit controller output
        if (Tdelta_controller < -controller_out_limit)
            Tdelta_controller = -controller_out_limit;
        else if (Tdelta_controller > controller_out_limit)
            Tdelta_controller = controller_out_limit;

        // First order lag
        u_[1] = u_[0];
        u_[0] = Tdelta_controller;

        y_[1] = y_[0];
        y_[0] = (dt * (u_[0] + u_[1]) - (dt - 2 * tau_lag) * y_[1]) / (2 * tau_lag * dt);

        // Sum input torques
        Tphi   = -Tphi_controller + Tphi_external;
        Tdelta = -u_[0] + Tdelta_external;

        // State derivatives
        float[] statedbldot = Dynamics(new float[] { phi, delta, phidot, deltadot, v, psi }, new float[] { Tphi, Tdelta });
      
        // Integration
        phidot += statedbldot[0] * dt;
        deltadot += statedbldot[1] * dt;

        phi += phidot * dt;
        delta += deltadot * dt;

        psi += statedbldot[2] * dt;

        x += statedbldot[3] * dt;
        y += statedbldot[4] * dt;

        // Update animation
        Bike.transform.position = new Vector3(y, 0, x);
        Bike.transform.eulerAngles = new Vector3(0, psi * 180.0f / Mathf.PI, -phi * 180.0f / Mathf.PI);
        Fork.transform.localEulerAngles = new Vector3(0, delta * 180.0f / Mathf.PI, 0);
        
        // Update GUI
        txtPhi.text = phi.ToString("0.00");
        txtDelta.text = delta.ToString("0.00");
        txtPhiDot.text = phidot.ToString("0.00");
        txtDeltaDot.text = deltadot.ToString("0.00");
        txtVelocity.text = v.ToString("0.00");
        txtYaw.text = psi.ToString("0.00");
        txtXPos.text = x.ToString("0.00");
        txtYPos.text = y.ToString("0.00");

        // Check if need to remove external input (impulse)
        if (leanImp)
        {
            leanImp = false;
            Tphi_external = 0;
        }

        if (steerImp)
        {
            steerImp = false;
            Tdelta_external = 0;
        }
        
	}

    void RK45(float h)
    {

        float[] control_inputs = new float[] { Tphi, Tdelta };

        float h2 = h / 2.0f;
        float h6 = h / 6.0f;

        float[] a_ = Dynamics(new float[] { phi, delta, phidot, deltadot, v, psi }, control_inputs);

        float[] b_ = Dynamics(new float[] {phi    + h2 * a_[0], delta    + h2 * a_[1],
                                           phidot + h2 * a_[2], deltadot + h2 * a_[3],
                                           v                  , psi      + h2 * a_[5]}, control_inputs);

        float[] c_ = Dynamics(new float[] {phi    + h2 * b_[0], delta    + h2 * b_[1],
                                           phidot + h2 * b_[2], deltadot + h2 * b_[3],
                                           v                  , psi      + h2 * b_[5]}, control_inputs);

        float[] d_ = Dynamics(new float[] {phi    + h * c_[0], delta    + h * c_[1],
                                           phidot + h * c_[2], deltadot + h * c_[3],
                                           v                 , psi      + h * c_[5]}, control_inputs);


        // Update state
        phidot   += h6 * (a_[0] + 2 * b_[0] + 2 * c_[0] + d_[0]);
        deltadot += h6 * (a_[1] + 2 * b_[1] + 2 * c_[1] + d_[1]);
        psi      += h6 * (a_[2] + 2 * b_[2] + 2 * c_[2] + d_[2]);

        x += h6 * (a_[3] + 2 * b_[3] + 2 * c_[3] + d_[3]);
        y += h6 * (a_[4] + 2 * b_[4] + 2 * c_[4] + d_[4]);

        phi   += phidot * h;
        delta += deltadot * h;

    }

    float[] Dynamics(float[] state, float[] control_inputs)
    {

        float phi_    = state[0]; float delta_    = state[1];
        float phidot_ = state[2]; float deltadot_ = state[3];
        float v_      = state[4]; float psi_      = state[5];

        float Tphi_ = control_inputs[0]; float Tdelta_ = control_inputs[1];

        float vs = v_ * v_;

        float phidbldot_ = phi_ * (k1 * (K021 + K221 * vs) - k2 * (K011 + K211 * vs)) + delta_ * (k1 * (K022 + K222 * vs) - k2 * (K012 + K212 * vs)) + phidot_ * (k1 * C21 * v_ - k2 * C11 * v_) + deltadot_ * (k1 * C22 * v_ - k2 * C12 * v_) + (k2 * Tphi_ - k1 * Tdelta_);
        float deltadbldot_ = phi_ * (k3 * (K011 + K211 * vs) - k4 * (K021 + K221 * vs)) + delta_ * (k3 * (K012 + K212 * vs) - k4 * (K022 + K222 * vs)) + phidot_ * (k3 * C11 * v_ - k4 * C21 * v_) + deltadot_ * (k3 * C12 * v_ - k4 * C22 * v_) + (-k3 * Tphi_ + k4 * Tdelta_);

        float psidot_ = v_ * Mathf.Tan(delta_) / wheel_base; // 1.02 = wheel base
        float xdot_ = v_ * Mathf.Cos(psi_);
        float ydot_ = v_ * Mathf.Sin(psi_);

        return new float[] { phidbldot_, deltadbldot_, psidot_, xdot_, ydot_ };

    }

    void handleControlInputs(int ID)
    {
        float magnitude = (float) System.Convert.ToDouble(txtMagnitude.text);

        switch (ID)
        {
            // Lean
            case 0:
                leanImp = true;
                Tphi_external = magnitude;
                break;
            case 1:
                leanImp = false;
                Tphi_external = magnitude;
                break;
            case 2:
                leanImp = false;
                Tphi_external = 0;
                break;

            // Steer
            case 3:
                steerImp = true;
                Tdelta_external = magnitude;
                break;
            case 4:
                steerImp = false;
                Tdelta_external = magnitude;
                break;
            case 5:
                steerImp = false;
                Tdelta_external = 0;
                break;
        }

    }

    void changeVelocity()
    {
        v = scrVelocity.value * 10.0f;
    }

    void changeNoise()
    {
        sensorNoise = scrNoise.value / 2.0f;
    }

    void changeOutputLimit()
    {
        controller_out_limit = scrOutputLimit.value * 10.0f;
    }

    void changeDelay()
    {
        tau_lag = (scrDelay.value + 1) * 15.0f;
        Debug.Log(tau_lag);
    }

}