#ifndef STATE_FDBCK_CTR_H
#define STATE_FDBCK_CTR_H

#include "Arduino.h"

class StateFeedbackController {
	
	private:
	
		const int NUM_POINTS = 24;
	
		float LOOKUP_V[] = { 0.00, 0.25, 0.50, 0.75,
							 1.00, 1.25, 1.50, 1.75,
							 2.00, 2.25, 2.50, 2.75,
							 3.00, 3.25, 3.50, 3.75,
							 4.00, 4.25, 4.50, 4.75,
							 5.00, 5.25, 5.50, 5.75 };

		float LOOKUP_K[][NUM_POINTS] = { {0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
										 {0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
										 {0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00},
										 {0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00} };

							 
		float min_out;
		float max_out;
		
		float out;
	
		float interpolate(int gain_index, float v) {
			
			float gain;
			
			for (int i = 0; i < NUM_POINTS - 2; i++) {
				
				if (v >= LOOKUP_V[i] && v <= LOOKUP_V[i + 1]) {
					
					float gradient  = (LOOKUP_K[gain_index][i + 1] - LOOKUP_K[gain_index][i]) / (LOOKUP_V[i + 1] - LOOKUP_V[i]);
					float intercept = LOOKUP_K[gain_index][i] - gradient * LOOKUP_V[i];
					
					gain = gradient * v + intercept;
					
					return gain;
				}
				
			}
			
			gain = LOOKUP_K[gain_index][NUM_POINTS - 1]; // Velocity is out of range, return gain for highest velocity
			return gain;
			
		}
	
	public:
	
		StateFeedbackController(float min_out, float max_out) {
			
			this->min_out = min_out;
			this->max_out = max_out;
			out = 0;
			
		}
		
		void reset() { out = 0;	}
		
		float update(float phi, float delta, float phidot, float deltadot, float v) {
			
			// Gain scheduling by interpolation from lookup tables (i.e. pre-compute gains to place poles, then create piece-wise linear model)
			float k1 = interpolate(0, v);
			float k2 = interpolate(1, v);
			float k3 = interpolate(2, v);
			float k4 = interpolate(3, v);
			
			// u = -K*x
			out = -(k1 * phi + k2 * delta + k3 * phidot + k4 * deltadot);
			
			// Clamp output
			if (out < min_out) {
				out = min_out;
			} else if (out > max_out) {
				out = max_out;
			}
			
			return out
			
		}
		
		float getOutput() { return out; }
	
};

#endif
