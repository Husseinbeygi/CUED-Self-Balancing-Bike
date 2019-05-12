/*
 * Author: Philip Salmony
 * Date: 15/03/2019 
 */

#include "PID.h"

PID::PID() {
  this->reset();
}

void PID::init(float Kp, float Ki, float Kd, float Tf, float limOutputMin, float limOutputMax, float limIntegralMin, float limIntegralMax) {
  this->Kp = Kp; this->Ki = Ki; this->Kd = Kd; this->Tf = Tf;
  this->limOutputMin = limOutputMin; this->limOutputMax = limOutputMax;
  this->limIntegralMin = limIntegralMin; this->limIntegralMax = limIntegralMax;

  this->reset();
}

float PID::update(float setpoint, float measurement, float dt) {
  float error = setpoint - measurement;
  
  /* Proportional */
  proportional = Kp * error;

  /* Integral */
  integral = integral + 0.5 * Ki * dt * (error + prevError);

  /* Clamp integral */
  if (integral > limIntegralMax)
    integral = limIntegralMax;
  else if (integral < limIntegralMin)
    integral = limIntegralMin;

  /* Derivative (on measurement) */
  derivative = (2 * Kd * (prevMeasurement - measurement) - derivative * (dt - 2 * Tf)) / (2 * Tf + dt);

  /* Calculate controller output */
  controllerOutput = proportional + integral + derivative;  

  /* Clamp output */
  if (controllerOutput > limOutputMax)
    controllerOutput = limOutputMax;
  else if (controllerOutput < limOutputMin)
    controllerOutput = limOutputMin;

  prevError = error;
  prevMeasurement = measurement;

  return controllerOutput;
}

float PID::getOutput() {
  return controllerOutput;
}

void PID::reset() {
  integral        = 0.0;
  derivative      = 0.0;
  prevError       = 0.0;
  prevMeasurement = 0.0;
}

void PID::setKp(float Kp) {
  this->Kp = Kp;
}

void PID::setKi(float Ki) {
  this->Ki = Ki;
}

void PID::setKd(float Kd) {
  this->Kd = Kd;
}

void PID::setTf(float Tf) {
  this->Tf = Tf;
}

void PID::setLimit(float lim) {
  this->limOutputMin = -lim; this->limOutputMax = lim;
  this->limIntegralMin = -lim/2.0; this->limIntegralMax = lim/2.0;
}
