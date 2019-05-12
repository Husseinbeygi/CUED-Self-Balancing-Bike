#include "IMU.h"
#include "SpeedSensor.h"
#include "ButterworthLPFilter.h"
#include "KalmanFilter.h"
#include "ComplimentaryFilter.h"
#include "StateFeedbackController.h"

// PINS
const int PIN_SPEED_SENSOR	   = 3
const int PIN_HANDLEBAR_SENSOR = 4
const int PIN_SERVO		   	   = 5

// CONSTANTS
const int SERIAL_BAUD = 115200;

const float DT					= 0.01;
const float DT_IMU 		   		= 0.01;
const float DT_COMP_FILTER 		= 0.01;
const float DT_HANDLEBAR_SENSOR = 0.01;

const int   SPEED_SENSOR_NUM_MAGNETS = 10;
const float WHEEL_RADIUS 			 = 0.32;

const float COMP_FILTER_ALPHA = 0.01;

const float LP_FILTER_PHIDOT_FC   = 20;
const float LP_FILTER_DELTADOT_FC = 20;

const float SERVO_MIN_ANGLE = -90;
const float SERVO_MAX_ANGLE =  90;

const int SERVO_MIN_PWM = 500;
const int SERVO_MAX_PWM = 2500; 

// GLOBAL OBJECTS
IMU imu(DT_IMU);
SpeedSensor speed_sensor(PIN_SPEED_SENSOR, SPEED_SENSOR_NUM_MAGNETS, WHEEL_RADIUS);
PositionalPotentiometer handlebar_sensor(PIN_HANDLEBAR_SENSOR, DT_HANDLEBAR_SENSOR);
ComplimentaryFilter comp_filter(COMP_FILTER_ALPHA, 0.0, DT_COMP_FILTER);
StateFeedbackController controller(SERVO_MIN_ANGLE, SERVO_MAX_ANGLE);
ButterworthLPFilter lp_filter_phidot(LP_FILTER_PHIDOT_FC, DT);
ButterworthLPFilter lp_filter_deltadot(LP_FILTER_DELTADOT_FC, DT);

// GLOBAL VARIABLES
unsigned long start_time;
float run_time;

// STATES
float phi, delta, phidot, deltadot;
float v;

float delta_prev;

// CONTROLLER OUTPUT, SERVO INPUT
float controller_out;
int servo_in;

void setup() {
	
	Serial.begin(SERIAL_BAUD);
	Serial.println("Started.");	
			
	// Initial state estimate
	phi = 0; delta = 0; phidot = 0; deltadot = 0; v= 0;
		
	start_time = millis();
	run_time   = 0;
	
}

void loop() {
	
	// I) ACQUIRE RAW SENSOR DATA
	imu.update();
	v 	  = speed_sensor.update();
	delta = handlebar_sensor.update();
	
	// II) PROCESS RAW SENSOR DATA
	phi      = comp_filter.update(imu.gX(), imu.getRoll());
	phidot   = lp_filter_phidot(comp_filter.getOutputDot());
	deltadot = lp_filter_deltadot(handlebar_sensor.getOutputDot());
	
	// III) GET CONTROLLER OUTPUT
	controller_out = controller.update(phi, phidot, delta, deltadot, v);
	
	// IV) MAP CONTROLLER OUTPUT TO SERVO INPUT	
	servo_in = (int) map(controller_out, SERVO_MIN_ANGLE, SERVO_MAX_ANGLE, SERVO_MIN_PWM, SERVO_MAX_PWM);
	
	// V) ACTUATE SERVO
	
	// VI) LOG DATA
	
	// VII) SLEEP	
	delay(DT * 1000);
	
	// VIII) CALCULATE TOTAL RUN TIME
	run_time = (millis() - start_time) * 0.001;
	
}