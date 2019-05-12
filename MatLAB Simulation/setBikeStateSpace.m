function [Bike, A, B, C, D, ssBike] = setBikeStateSpace(Bike, v, createSSObject)

    %%%%%%%%%%%%%%%%%%%%%
    % State Space Model %
    %%%%%%%%%%%%%%%%%%%%%

    % States: [phi, delta, phidot, deltadot]
    % Inputs: [Torque(Phi), Torque(Delta)]

    % phidbldot   = phi * (k1 * (K021 + K221*v^2) - k2 * (K011 + K211*v^2)) + delta * (k1 * (K022 + K222*v^2) - k2 * (K012 + K212*v^2)) + phidot * (k1 * C21 * v - k2 * C11 * v) + deltadot * (k1 * C22 * v - k2 * C12 * v) + ( k2 * Tphi - k1 * Tdelta)
    % deltadbldot = phi * (k3 * (K011 + K211*v^2) - k4 * (K021 + K221*v^2)) + delta * (k3 * (K012 + K212*v^2) - k4 * (K022 + K222*v^2)) + phidot * (k3 * C11 * v - k4 * C21 * v) + deltadot * (k3 * C12 * v - k4 * C22 * v) + (-k3 * Tphi + k4 * Tdelta)

    Bike.A = zeros(4);
    
    % Phidot, Deltadot
    Bike.A(1,3) = 1; Bike.A(2,4) = 1;
    Bike.A(3,1) = Bike.k1 * (Bike.K_0(2,1) + Bike.K_2(2,1) * v^2) - Bike.k2 * (Bike.K_0(1,1) + Bike.K_2(1,1) * v^2);
    Bike.A(3,2) = Bike.k1 * (Bike.K_0(2,2) + Bike.K_2(2,2) * v^2) - Bike.k2 * (Bike.K_0(1,2) + Bike.K_2(1,2) * v^2);
    Bike.A(3,3) = v * (Bike.k1 * Bike.C_1(2,1) - Bike.k2 * Bike.C_1(1,1));
    Bike.A(3,4) = v * (Bike.k1 * Bike.C_1(2,2) - Bike.k2 * Bike.C_1(1,2));
    Bike.A(4,1) = Bike.k3 * (Bike.K_0(1,1) + Bike.K_2(1,1) * v^2) - Bike.k4 * (Bike.K_0(2,1) + Bike.K_2(2,1) * v^2);
    Bike.A(4,2) = Bike.k3 * (Bike.K_0(1,2) + Bike.K_2(1,2) * v^2) - Bike.k4 * (Bike.K_0(2,2) + Bike.K_2(2,2) * v^2);
    Bike.A(4,3) = v * (Bike.k3 * Bike.C_1(1,1) - Bike.k4 * Bike.C_1(2,1));
    Bike.A(4,4) = v * (Bike.k3 * Bike.C_1(1,2) - Bike.k4 * Bike.C_1(2,2));

    % Inputs
    
    % Including roll torque disturbance
    Bike.B = zeros(4,2);
    Bike.B(3,1) =  Bike.k2; Bike.B(3,2) = -Bike.k1;
    Bike.B(4,1) = -Bike.k3; Bike.B(4,2) =  Bike.k4;

    % Handlebar torque only
    %Bike.B = zeros(4,1);
    %Bike.B(3,1) = -Bike.k3; Bike.B(4,1) = Bike.k4;
    
    % Outputs
    Bike.C = eye(4); Bike.D = 0;
    
    A = Bike.A; B = Bike.B; C = Bike.C; D = Bike.D;
    
    if (createSSObject)
        ssBike = ss(A,B,C,D);
        ssBike.StateName = {'Lean Angle', 'Steer Angle', 'Lean Angular Velocity', 'Steer Angular Velocity'};
        ssBike.StateUnit = {'rad', 'rad', 'rad/s', 'rad/s' };
        ssBike.InputName = {'Roll Torque Disturbance', 'Handlebar Torque'};
        ssBike.InputUnit = {'Nm' , 'Nm'};
        ssBike.OutputName = ssBike.StateName;
        ssBike.OutputUnit = ssBike.StateUnit;
    else
        ssBike = 0;
    end

end