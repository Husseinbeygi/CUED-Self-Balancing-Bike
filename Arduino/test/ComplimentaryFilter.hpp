#ifndef COMPLIMENTARY_FILTER_H
#define COMPLIMENTARY_FILTER_H

#include "Arduino.h"

class ComplimentaryFilter {
	
	private:
	
		float alpha;
		
		float out;
		float out_prev;
	
		float dt;
		float last_time;
	
	public:
	
		ComplimentaryFilter(float alpha) {

			this->alpha = alpha;
			reset(0.0);

		}
		
		void reset(float init_value) {

			out 	   = init_value;
			out_prev = 0.0;
			
			last_time = micros();

		}
		
		float update(float gyro, float accelerometer) {
			
			float current_time = micros();
			
			dt = 0.000001 * (current_time - last_time);
				
			out_prev = out;
			out = (1 - alpha) * (out_prev + gyro * dt) + alpha * accelerometer;	

      last_time = current_time;
				
			return out;

		}
		
		float getOutput() 	 { return out;	}		
		float getOutputDot() { return ((out - out_prev) / dt); }			
	
};

#endif
