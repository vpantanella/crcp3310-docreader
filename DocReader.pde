// YOUR NAME
// ...

BufferedReader reader;
final String FILENAME = "alice.txt";

void setup() {
  size(400, 400);
  readAndPrintOneCharacter();
}

void draw() {
  
}

void readAndPrintOneCharacter() {
  reader = createReader(FILENAME);
  try {
    int character = reader.read();
    println((char)character);
  } catch (IOException e) {
    println("Could not read data.");
    e.printStackTrace();
  }
  
}