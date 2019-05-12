#include <Wire.h>
#include "BNO055.h"

#define BNO055_ADDR 0x29
#define IMU_DT_US 20000

BNO055 bno(BNO055_ADDR);

float roll;
float yaw;
volatile byte rcVal;

unsigned long timerIMU;
volatile int timerPWM;

volatile bool transmitting = false;

union {
  float val;
  uint8_t bytes[4];
} FloatParser;

void setup() {
  Wire.begin();
  bno.init();

  Serial.begin(115200);

  roll = yaw = 0.0;
  rcVal = 0;
  
  timerIMU = micros();  
  timerPWM = micros();
}

void loop() {
  if (Serial.available() > 0) {

    transmitting = true;
        
    // Clear buffer
    Serial.read();

    Serial.write((byte) 254);
    FloatParser.val = roll;
    for (uint8_t n = 0; n < 4; n++)
      Serial.write((byte) FloatParser.bytes[n]);
    FloatParser.val = yaw;
    for (uint8_t n = 0; n < 4; n++)
      Serial.write((byte) FloatParser.bytes[n]);  

    transmitting = false;
  }

  if (micros() - timerIMU >= IMU_DT_US) {
    bno.readEul();
    roll = bno.euler.y;
    yaw  = bno.euler.x;
    if (yaw > 180.0)
      yaw -= 360.0;
    timerIMU += IMU_DT_US;
  }  
}
