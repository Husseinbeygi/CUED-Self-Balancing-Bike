#ifndef IMU_H
#define IMU_H

#include <Wire.h>
#include <Arduino.h>

class IMU {

  private:

    void imuReadRaw(float *leanAcc, float *gx){
      
      Wire.beginTransmission(MPU_addr);
      Wire.write(0x3B);  // starting with register 0x3B (ACCEL_XOUT_H)
      Wire.endTransmission(false);
      Wire.requestFrom(MPU_addr,14,true);  // request a total of 14 registers
    
      int16_t AcX, AcY, AcZ, Tmp, GyX, GyY, GyZ;
      
      AcX=Wire.read()<<8|Wire.read();  // 0x3B (ACCEL_XOUT_H) & 0x3C (ACCEL_XOUT_L)    
      AcY=Wire.read()<<8|Wire.read();  // 0x3D (ACCEL_YOUT_H) & 0x3E (ACCEL_YOUT_L)
      AcZ=Wire.read()<<8|Wire.read();  // 0x3F (ACCEL_ZOUT_H) & 0x40 (ACCEL_ZOUT_L)
      
      Tmp=Wire.read()<<8|Wire.read();  // 0x41 (TEMP_OUT_H) & 0x42 (TEMP_OUT_L)
    
      GyX=Wire.read()<<8|Wire.read();  // 0x43 (GYRO_XOUT_H) & 0x44 (GYRO_XOUT_L)
      GyY=Wire.read()<<8|Wire.read();  // 0x45 (GYRO_YOUT_H) & 0x46 (GYRO_YOUT_L)
      GyZ=Wire.read()<<8|Wire.read();  // 0x47 (GYRO_ZOUT_H) & 0x48 (GYRO_ZOUT_L)
    
      float ax = (float) AcX / 16384.0;
      float ay = (float) AcY / 16384.0;
      float az = (float) AcZ / 16384.0;
    
      *gx = (float) -GyX / 131.0;
      *leanAcc = -atan2(ay, sqrt(ax * ax + az * az)) * 180 / PI;
    }

    const int MPU_addr = 0x68;

  public:

    float bias = 4.4;
    float alpha = 0.05;
    float lpfAlpha = 0.5;

    void init() {
      Wire.begin();
      Wire.beginTransmission(MPU_addr);
      Wire.write(0x6B);  // PWR_MGMT_1 register
      Wire.write(0);     // set to zero (wakes up the MPU-6050)
      Wire.endTransmission(true);
    }

    float getLean(float dt) {    
      static float leanEstimate = 0.0;
      static float gxlpf = 0.0;
      static float acclpf = 0.0;
      
      float leanAcc, gx;
      imuReadRaw(&leanAcc, &gx);
    
      gx = (gx - bias);
      
      gxlpf = lpfAlpha * gxlpf + (1 - lpfAlpha) * gx;
      acclpf = lpfAlpha * acclpf + (1 - lpfAlpha) * leanAcc;
    
      leanEstimate = alpha * leanAcc + (1 - alpha) * (leanEstimate + gxlpf * dt);

      return leanEstimate;
    }
    
  void Calibrate(uint8_t iterations) {
    float tempLean;
    float tempGx;
    float tempBias = 0.0;
  
    for (uint8_t n = 0; n < iterations; n++) {
      
      imuReadRaw(&tempLean, &tempGx);
  
      tempBias += tempGx;
  
      delay(10);
      
    }
  
    bias = tempBias / (float) iterations;    
  }

};

#endif
