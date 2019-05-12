#pragma config(Motor, motorA, handlebarMotor, tmotorEV3_Large, PIDControl, reversed, encoder)

task main() {

	while (true) {

		writeDebugStreamLine("Encoder: %d", getMotorEncoder(handlebarMotor));

	}

}
