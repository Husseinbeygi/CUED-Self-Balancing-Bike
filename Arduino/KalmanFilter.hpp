#ifndef KALMAN_FILTER_H
#define KALMAN_FILTER_H

#include "BasicLinearAlgebra.h"

class KalmanFilter {

	private:
	
		// State Space Model
		BLA::Matrix<4,4> A;
		BLA::Matrix<4,1> B;
		BLA::Matrix<4,4> C;
				
		// Filter Parameters
		BLA::Matrix<4,4> P;						 
		BLA::Matrix<4,4> Q;
		BLA::Matrix<4,4> R;
		
		// State Estimate
		BLA::Matrix<4,1> x;
		
		// Identity Matrix
		BLA::Matrix<4,4> I;
		
		void setA(double velocity) {
			
			A(2,0) =  5.2096;
			A(2,1] =  0.049539 - 0.52226 * velocity * velocity ;
			A(2,2] = -0.15825 * velocity;
			A(2,3] = -0.37642 * velocity;

			A(3,0) =  17.9804;
			A(3,1) =  10.2922 - 2.5197 * velocity * velocity;
			A(3,2) =  3.6888 * velocity;
			A(3,3) = -3.0749 * velocity;  

		}
		
	public:
	
		KalmanFilter(double p, double q, double r) {

			reset(p, q, r);
					
			B << 0, 0, -0.1866, 4.3488;
			
			C << 1, 0, 0, 0,
				 0, 1, 0, 0,
				 0, 0, 1, 0,
				 0, 0, 0, 1;
				 				 
			I << 1, 0, 0, 0,
				 0, 1, 0, 0,
				 0, 0, 1, 0,
				 0, 0, 0, 1;
				 	 			
		}
		
		void reset(double p, double q, double r) {
			
			// Initialise state space matrices			
			A << 0, 0, 1, 0,
				 0, 0, 0, 1,
				 0, 0, 0, 0,
				 0, 0, 0, 0;
			
			setA(0.0);
			
			P << p, 0, 0, 0,
				 0, p, 0, 0,
				 0, 0, p, 0,
				 0, 0, 0, p;

			Q << q, 0, 0, 0,
				 0, q, 0, 0,
				 0, 0, q, 0,
				 0, 0, 0, q;

			R << r, 0, 0, 0,
				 0, r, 0, 0,
				 0, 0, r, 0,
				 0, 0, 0, r;
				 
			setInitState(0, 0, 0, 0);
			
		}
		
		void setInitState(double x1, double x2, double x3, double x4) {
			
			x << x1, x2, x3, x4;
			
		}
		
		void update(double phi_m, double delta_m, double phidot_m, double deltadot_m, double v) {
			
			setA(v);
			
			BLA::Matrix<4,1> measurement;
			measurement << phi_m, delta_m, phidot_m, deltadot_m;
			
			BLA::Matrix<4,1> y_tilde = measurement - C * x;
			BLA::Matrix<4,4> S = R + C * P * ~C;
			BLA::Matrix<4,4> K = P * ~C * S.inverse();
			
			x = x + K * y_tilde;
			P = (I - K * C) * P;			
			
		}
		
		double phi()      { return x(1,1); }
		double delta()    { return x(2,1); }
		double phidot()   { return x(3,1); }
		double deltadot() { return x(4,1); }	

};

#endif
