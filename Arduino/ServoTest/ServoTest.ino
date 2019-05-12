#include <SoftwareSerial.h>

SoftwareSerial servo(10, 11);

void setup() {

  Serial.begin(115200);
  while (!Serial);

  servo.begin(9600);

  Serial.println("Started.");

}

void loop() {

  if (Serial.available() > 0) {

    String data = Serial.readString();
    

    servo.print(data);

    Serial.print(data);
   
  }

  delay(50);

}
