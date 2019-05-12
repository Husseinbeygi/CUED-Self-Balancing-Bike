#define CTRL_PIN 3

int val;

/*
 * 
 * Motor starts at approx. val = 70
 * Careful: Motor is very "jumpy", use smooth increase of val 
 * to get to target motor speed 
 * 
 */

void setup() {

  Serial.begin(115200);
  while (!Serial);

  pinMode(CTRL_PIN, OUTPUT);
  val = 0;

  Serial.println("Started.");

}

void loop() {

  if (Serial.available() > 0) {

    val = (int) (Serial.parseInt());

    if (val > 255)
      val = 255;
    else if (val < 0)
      val = 0;
    
    Serial.print("Wrote new value: "); Serial.println(val);
    
  }

  delay(100);

}
