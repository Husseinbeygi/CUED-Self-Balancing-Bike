#ifndef KALMANGYR_H
#define KALMANGYR_H

struct KalmanFilter {

	float x[2];

	float P[2][2];
	float Q[2][2];
	float R;

	float K[2];

};

void KalmanInit(struct KalmanFilter *kal, float bias, float valP, float valQ, float valR) {

	kal->x[0] = 0.0;
	kal->x[1] = bias;

	for (int i = 0; i < 2; i++) {

		for (int j = 0; j < 2; j++) {

			if (i == j) {

				kal->Q[i][j] = valQ;
				kal->P[i][j] = valP;

			} else {

				kal->Q[i][j] = 0.0;
				kal->P[i][j] = 0.0;

			}

		}
	}

	kal->R = valR;

}

void KalmanUpdate(struct KalmanFilter *kal, float measurement, float input, float dt) {

	kal->x[0] = (kal->x[0] - dt * kal->x[1]) + dt * input;

	float q1 = kal->Q[0][0]; float q2 = kal->Q[1][1];
	float p00 = kal->P[0][0]; float p01 = kal->P[0][1];
	float p10 = kal->P[1][0]; float p11 = kal->P[1][1];

	kal->P[0][0] = p00 + q1 - dt * (p01 - dt * p11) - dt * p10; kal->P[0][1] = p01 - dt * p11;
	kal->P[1][0] = p10 - dt * p11; 															kal->P[1][1] = p11 + q2;

	float y = measurement - kal->x[0];

	float s = kal->P[0][0] + kal->R;

	kal->K[0] = kal->P[0][0] / s;
	kal->K[1] = kal->P[1][0] / s;

	kal->x[0] = kal->x[0] + kal->K[0] * y;
	kal->x[1] = kal->x[1] + kal->K[1] * y;

	kal->P[0][0] = (1 - kal->K[0]) * kal->P[0][0]; 					kal->P[0][1] = (1 - kal->K[0]) * kal->P[0][1];
	kal->P[1][0] = kal->P[1][0] - kal->K[1] * kal->P[0][0]; kal->P[1][1] = kal->P[1][1] - kal->K[1] * kal->P[0][1];


}

#endif
