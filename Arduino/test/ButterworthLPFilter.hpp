#ifndef BW_LP_FILTER_H
#define BW_LP_FILTER_H

#include "Arduino.h"
#include <math.h>

class ButterworthLPFilter {
	
	private:
	
		float fc;
		float fs;
		
		float wc;
		
		float a[3];
		float b[3];
		float u[3];
		float y[3];
	
	public:
	
		ButterworthLPFilter(float fc, float fs) {
			
			this->fc = fc;
			this->fs = fs;
			
			// Compute pre-warped cut-off frequency
			wc = (float) 2 * fs * tan(M_PI * fc / fs);
			
			// Compute filter coefficients
			float T = 1 / fs; float TT = T * T; float ww = wc * wc;
			
			a[0] = ww * TT;
			a[1] = 2 * ww * TT;
			a[2] = ww * TT;
			
			b[0] = ww * TT + 2.8284 * wc * T + 4;
			b[1] = 2 * ww * TT - 8;
			b[2] = ww * TT - 2.8284 * wc * T + 4;
			
			reset();
			
		}
		
		void reset() {
			
			for (int i = 0; i < 3; i++) {
				u[i] = 0; y[i] = 0;
			}				
			
		}
		
		float update(float val) {
			
			// Shift arrays and set latest input
			u[2] = u[1]; u[1] = u[0]; u[0] = val;
			y[2] = y[1]; y[1] = y[0];
			
			// Calculate filtered output
			y[0] = ((a[0] * u[0] + a[1] * u[1] + a[2] * u[2]) - (b[1] * y[1] + b[2] * y[2])) / b[0];
			
			return y[0];
			
		}
		
		float getOutput() { return y[0]; }
	
};

#endif
