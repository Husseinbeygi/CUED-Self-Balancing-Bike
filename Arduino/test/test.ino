#include "IMU.hpp"
#include "ComplimentaryFilter.hpp"

const unsigned long DT_us = 400;

IMU imu;
ComplimentaryFilter comp_filter_phi(0.1);

void setup() {

  Serial.begin(500000);
  Serial.println("Started.");

  imu.init();
  comp_filter_phi.reset(0.0);
  
}

void loop() {

  static unsigned long lastRead;

  if (micros() - lastRead >= DT_us) {

    lastRead += DT_us;

   // imu.update();

    //Serial.println(comp_filter_phi.update(imu.gX(), imu.getRoll()) * 180.0 / 3.14159);
    Serial.println((lastRead / 1000000.0));

  }

}

