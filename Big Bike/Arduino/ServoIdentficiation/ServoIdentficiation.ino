const unsigned long DT = 50000;
unsigned long timer;

float t = 0.0;

void setup() {

  Serial.begin(115200);

  // Servo
  Serial3.begin(9600);
  while (!Serial3);
  
  // Reset encoder
  Serial3.print("P0\r");
  delay(50);

  // Set 0 damping
  Serial3.print("D0\r");
  delay(50);

  // Set integral control at servo
  Serial3.print("C0\r");
  delay(50);

  Serial3.print("A750\r");
  delay(50);

  Serial3.print("B10000\r"); //Serial3.print("B7500\r");
  delay(50);

  // Set maximum speed
  Serial3.print("M255\r");
  delay(50);
  
  Serial3.print("P0\r");
  delay(50);
  
  Serial3.print("G0\r");
  delay(50);

  Serial.println("SEND COMMAND TO START...");
  while (!(Serial.available() > 0));

  while (Serial.available() > 0)
    Serial.read();
  

  timer = micros();
}

void loop() {

  if (Serial.available() > 0) {
    Serial.println("STOPPED.");
    while (1);    
  }

  if (micros() - timer >= DT) {

    float dt = (float) (micros() - timer) / 1000000.0;

    Serial3.print("G+100\r");

    Serial3.print("P\r\n");
    if (Serial3.available() > 0) {
      Serial.print(t, 4); Serial.print(",");
      while (Serial3.available() > 0) {
        char cur = Serial3.read();
        if (cur != '\r' && cur != '\n')
          Serial.print(cur);
      }
      Serial.println();
    }

    t += dt;

    timer = micros();
    
  }
    
}
