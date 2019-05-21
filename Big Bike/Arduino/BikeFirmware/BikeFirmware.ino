#include "PID.h"
#include "IMU.h"

#define IMU_DT_US 20000
#define CTRL_DT_US 20000
#define SERIAL_DT_US 100000
#define START_DT_US 1000000

// Drive
#define DRIVE_MOTOR_PIN 13
unsigned int driveSetting = map(14, 0, 100, 0, 1023);

// IMU
IMU mpu;

// Steering
int controllerOutput;
String cmd;
PID pidRoll;

// Roll angle
float roll = 0.0;
float steer = 0.0;

// Controller
float Kp = 1.00;
float Ki = 0.00;
float Kd = 0.00;
float Tf = 0.0110;
int ctrlAngleLimit = 60;

// Telemetry
bool parsing;
byte parseNumber = (byte) 0;

unsigned long timerIMU, timerCTRL, timerSERIAL, timerSTART;

bool started = false;

bool parsingIMU = false;
uint8_t parsingIMUcount = 0;


void setup() {

 // Serial.begin(115200);

  mpu.init();

  // Radio
  Serial2.begin(115200);
  while (!Serial2);

  // Servo
  Serial3.begin(9600);
  while (!Serial3);

  // Initialise drive motor output
  driveSetting = 0;
  analogWrite(DRIVE_MOTOR_PIN, driveSetting);

  // Reset encoder
  Serial3.print("P0\r");
  delay(50);

  // Set 0 damping
  Serial3.print("D0\r");
  delay(50);

  // Set integral control at servo
  Serial3.print("C0\r");
  delay(50);

  Serial3.print("A0\r");
  delay(50);

  Serial3.print("B10000\r"); //Serial3.print("B7500\r");
  delay(50);

  pidRoll.init(Kp, Ki, Kd, Tf, -ctrlAngleLimit, ctrlAngleLimit, -ctrlAngleLimit, ctrlAngleLimit);

  timerIMU = timerCTRL = timerSERIAL = timerSTART = micros();

}

void loop() {

  // Check if telemetry received
  if (Serial2.available()) {

    // Iterate through received bytes
    while (Serial2.available()) {

      // Get current byte
      byte data = Serial2.read();

      // See if parsing value (e.g. setting for controller gains, drive speed, etc.)
      if (parsing) {

        if (data == 255) { // Stop byte

          parsing = false;
          parseNumber = (byte) 0;

        } else { // Received parse data

          if (parseNumber == 0) { // Next byte indicates which setting to write

            parseNumber = data;

          } else {

            if (parseNumber == 1) { // Drive speed setting

              driveSetting = map((int) data, 0, 100, 0, 1023);

              if (started)
                analogWrite(DRIVE_MOTOR_PIN, driveSetting);

              Serial2.write(data);

            } else if (parseNumber == 2) { // Proportional gain

              Kp = ((float) ((int) data)) / 10.0;
              pidRoll.setKp((float) Kp);
              Serial2.write(data);

            } else if (parseNumber == 3) { // Integral gain

              Ki = ((float) ((int) data)) / 10.0;
              pidRoll.setKi((float) Ki);
              Serial2.write(data);

            } else if (parseNumber == 4) { // Derivative gain

              Kd = ((float) ((int) data)) / 10.0;
              pidRoll.setKd((float) Kd);
              Serial2.write(data);

            } else if (parseNumber == 5) { // Derivative filter cut-off frequency

              Tf = ((float) ((int) data)) / 100.0;
              pidRoll.setTf(Tf);
              Serial2.write(data);

            } else if (parseNumber == 6) {

              ctrlAngleLimit = (int) data;
              pidRoll.setLimit((float) ctrlAngleLimit);
              Serial2.write(data);
              
            }

          }

        }

      } else {

        if (data == 254) { // Start byte

          parsing = true;
          parseNumber = (byte) 0;

        } else if (data == 252) { // Start/Stop bike

          if (started) {

            analogWrite(DRIVE_MOTOR_PIN, 0);
            Serial3.print("G0\r");

            Serial2.write(253);
            started = false;

          } else {

            // Set maximum speed
            Serial3.print("M255\r");
            Serial3.print("G0\r");

            // Count down
            Serial2.write(103);
            delay(500);
            Serial2.write(102);
            delay(500);
            Serial2.write(101);
            delay(500);

            // Start drive motor (slow startup to prevent jolting)
            for (int i = 0; i <= driveSetting; i++) {
              analogWrite(DRIVE_MOTOR_PIN, i);
            }
            
            Serial2.write(252);
            started = true;
            timerSTART = micros();

          }

        } else if (data == 251) { // Reset encoder

          Serial3.print("P0\r");
          Serial2.write(251);

        } 

      } // if(parsing)

    } // while(available)

  } // if(available)

  // Do not need start command to sample from IMU
  if (micros() - timerIMU >= IMU_DT_US) {

    float dt = (float) (micros() - timerIMU) / 1000000.0;

    roll = -mpu.getLean(dt);   
      
    // Get controller output
    steer = pidRoll.update(0.0, roll, dt);
    controllerOutput = (int) round(5 * steer); /* Factor of 5 accounts for encoder mapping (0.2 deg / count) */

    // Compile actuator command
    cmd = "G";
    if (controllerOutput >= 0)
      cmd += "-";
    else
      cmd += "+";

    cmd += String(abs(controllerOutput));
    cmd += "\r";

   // Serial.print(roll); Serial.print(" "); Serial.print(steer); Serial.print(" "); Serial.print(controllerOutput); Serial.print(" "); Serial.println(cmd);

    timerIMU += IMU_DT_US;

  }

  if (started) {

    // SERVO COMMAND
    if ((micros() - timerCTRL >= CTRL_DT_US)) {
      Serial3.print(cmd);

      timerCTRL += CTRL_DT_US;
    }

    // TELEMETRY
    if (micros() - timerSERIAL >= SERIAL_DT_US) {

      // Start byte
      Serial2.write(254);

      if (roll >= 0)
        Serial2.write((byte) 1);
      else
        Serial2.write((byte) 0);

      Serial2.write((byte) abs(round(10 * roll)));

      if (steer >= 0)
        Serial2.write((byte) 1);
      else
        Serial2.write((byte) 0);

      Serial2.write((byte) abs(round(steer)));

      // Stop byte
      Serial2.write(255);

      timerSERIAL += SERIAL_DT_US;

    }

  } else {

    timerCTRL = timerSERIAL = micros();
    delay(10);

  }

}
