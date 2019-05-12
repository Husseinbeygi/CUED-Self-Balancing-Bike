String cmd;

void setup() {

  Serial.begin(115200);
  while (!Serial);

  Serial3.begin(9600);
  while (!Serial3);
  
  Serial.println("Started.");

}

void loop() {

  if (Serial.available() > 0) {

    cmd = Serial.readString();
    Serial3.print(cmd);

    Serial.print("Issued command:"); Serial.println(cmd);
    
  }

  if (Serial3.available() > 0) {

    String rxData = Serial3.readString();

    Serial.print("Data received: "); Serial.println(rxData);
    
  }
 
}
