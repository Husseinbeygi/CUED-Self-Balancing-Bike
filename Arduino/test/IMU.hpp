#ifndef IMU_H
#define IMU_H

// All angular measurements in radians

#include "Arduino.h"
#include <Wire.h>
#include <math.h>

class IMU {
	
	private:
		
		const int ADDR = 0x68;
		
		const float DEG2RAD = M_PI / 180.0;
	
		// X, Y, Z
		float acc[3];	// m/s^2
		float gyr[3];	// deg/s
		
		float temperature; // °C
		
		// Offsets
		float offset_gyr[3];
					
		void readRaw() {
			
			Wire.beginTransmission(ADDR);
			Wire.write(0x3B);
			Wire.endTransmission(false);
			Wire.requestFrom(ADDR, 14, true);
			
			acc[0] = ((float) (Wire.read() << 8 | Wire.read())) / 16384.0;
			acc[1] = ((float) (Wire.read() << 8 | Wire.read())) / 16384.0;
			acc[2] = ((float) (Wire.read() << 8 | Wire.read())) / 16384.0;
			
			temperature = ((float) (Wire.read() << 8 | Wire.read())) / 340.0 + 36.53;
			
			gyr[0] = ((float) (Wire.read() << 8 | Wire.read())) / 131.0;
			gyr[1] = ((float) (Wire.read() << 8 | Wire.read())) / 131.0;
			gyr[2] = ((float) (Wire.read() << 8 | Wire.read())) / 131.0;
			
		}
	
	public:
	
		IMU() {
      
      for (int i = 0; i < 3; i++)
        offset_gyr[i] = 0;
		
		}

    void init() {

      Wire.begin();
      Wire.beginTransmission(0x68);
      Wire.write(0x6B);
      Wire.write(0);
      Wire.endTransmission(true);
      
    }
    
		void update() { readRaw(); }
		
		void calibrateGyro(int iterations) {
			
			for (int i = 0; i < 3; i++)
				offset_gyr[i] = 0;
			
			for (int i = 0; i < iterations; i++) {
				
				readRaw();
				
				for (int i = 0; i < 3; i++)
					offset_gyr[i] += gyr[i];
				
				delay(10);
				
			}
			
			for (int i = 0; i < 3; i++)
				offset_gyr[i] /= iterations;			
			
		}
		
		float getRoll()  { return atan2(acc[1], sqrt(pow(acc[0], 2.0) + pow(acc[2], 2.0))); }
		float getPitch() { return atan2(acc[0], sqrt(pow(acc[1], 2.0) + pow(acc[2], 2.0))); }

    float getRollDEG()  { return (getRoll() * 180.0 / M_PI); }
    float getPitchDEG() { return (getPitch() * 180.0 / M_PI); }
      
		float aX() { return acc[0]; }
		float aY() { return acc[1]; }
		float aZ() { return acc[2]; }
	
		float gX() { return ((gyr[0] - offset_gyr[0]) * DEG2RAD); }
		float gY() { return ((gyr[1] - offset_gyr[1]) * DEG2RAD); }
		float gZ() { return ((gyr[2] - offset_gyr[2]) * DEG2RAD); }
	
};



#endif
