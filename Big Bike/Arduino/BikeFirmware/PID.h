/*
 * Author: Philip Salmony
 * Date: 15/03/2019 
 */

#ifndef PID_H
#define PID_H

#include <Arduino.h>

class PID {

  private:

    float Kp, Ki, Kd, Tf;
    
    float limOutputMin, limOutputMax;
    float limIntegralMin, limIntegralMax;

    float proportional, derivative, integral;
    float controllerOutput;   

    float prevError, prevMeasurement;

  public:

    PID();

    void init(float Kp, float Ki, float Kd, float Tf, float limOutputMin, float limOutputMax, float limIntegralMin, float limIntegralMax);

    float update(float setpoint, float measurement, float dt);
    float getOutput();
    void reset();

    void setKp(float Kp);
    void setKi(float Ki);
    void setKd(float Kd);
    void setTf(float Tf);

    void setLimit(float lim);
  
};

#endif
