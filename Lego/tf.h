#ifndef TF_H
#define TF_H

float updateTF(float error) {

	static float num[4] = {13.72, -39.8, 38.44, -12.36};
	static float den[4] = {1, -2.952, 2.905, -0.9529};

	static float y[4] = {0, 0, 0, 0};
	static float u[4] = {0, 0, 0, 0};

	u[3] = u[2]; u[2] = u[1]; u[1] = u[0]; u[0] = error;
	y[3] = y[2]; y[2] = y[1]; y[1] = y[0];

	y[0] = (num[0] * u[0] + num[1] * u[1] + num[2] * u[2] + num[3] * u[3] - (den[1] * y[1] + den[2] * y[2] + den[3] * y[3])) / den[0];

	return y[0];

}

#endif
