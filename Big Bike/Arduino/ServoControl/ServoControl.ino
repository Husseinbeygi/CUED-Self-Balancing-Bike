void setup() {

  Serial.begin(115200);
  while (!Serial);

  Serial3.begin(9600);
  while (!Serial3);

  Serial.println("STARTED");

}

void loop() {

  if (Serial.available() > 0) {

    String cmd = Serial.readString();

    Serial.println(cmd);

    Serial3.print(cmd);
    
  }
  
}
