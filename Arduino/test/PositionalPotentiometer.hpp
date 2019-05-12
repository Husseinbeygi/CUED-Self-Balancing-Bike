#ifndef POS_POT_H
#define POS_POT_H

#include "Arduino.h"

class PositionalPotentiometer {

	private:
	
		int sensor_pin;
	
		float position;
		float prev_position;
		
		float dt;
		float last_time;
	
		float convert(float val) { // TODO: Convert analog value to position
			
			return val;
			
		}
	
	public:
	
		PositionalPotentiometer(int sensor_pin) {
			
			this->sensor_pin = sensor_pin;
			
			pinMode(sensor_pin, INPUT);
			
			reset();		
			
		}
		
		void reset() {
						
			position = 0;
			prev_position = 0;
			last_time = micros();
			
		}
		
		float update() {
			
			float current_time = micros();
			
      dt = 0.000001 * (current_time - last_time);
				
			prev_position = position;
			position = convert(analogRead(sensor_pin));
				
			last_time = current_time;
     				
			return position;
			
		}
		
		float getPosition()    { return position; }
		float getPositionDot() { return ((position - prev_position) / dt); }

};

#endif
