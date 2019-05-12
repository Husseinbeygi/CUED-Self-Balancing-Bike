#ifndef SPEED_SENSOR_H
#define SPEED_SENSOR_H

#include "Arduino.h"

#define PI 3.14159265359

class SpeedSensor {

	private:
	
		int   sensor_pin;
		int   num_magnets;
		float radius;
	
		float factor;
		
		float last_time;
		float speed;
		
	public:
	
		SpeedSensor(int sensor_pin, int num_magnets, float radius) {
			
			this->sensor_pin  = sensor_pin;
			this->num_magnets = num_magnets;
			this->radius 	  = radius;
		
			factor = (2 * PI * radius) / num_magnets;
		
			pinMode(sensor_pin, INPUT);
			
			init();
			
		}

		void init() { last_time = micros(); }
		
		float update() {		
		
			if (digitalRead(sensor_pin)) {
				
				float current_time = micros();
				float dt 		   = (current_time - last_time) * 0.000001;
				last_time 		 = current_time;
				
				speed = factor / dt;		
				
			}
			
			return speed;
			
		}
		
		float getSpeed() {
			
			return speed;
			
		}
		
};

#endif
