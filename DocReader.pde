// YOUR NAME
// ...

BufferedReader reader;
final String FILENAME = "alice.txt";
int[] frequencies = new int[26];

void setup() {
  size(400, 400);
  prepareFrequencies();
  parseData();
}

void draw() {
  
}

void prepareFrequencies() {
  for (int i = 0; i < 26; ++i) {
    frequencies[i] = 0;
  }
}

void parseData() {
  reader = createReader(FILENAME);
  int character = 0;
  while (character != -1) {
    try {
      character = reader.read();
    } catch (IOException e) {
      println("Could not read data.");
      e.printStackTrace();
    }
    if (!Character.isAlphabetic(character)) continue;
    char letter = (char)Character.toLowerCase(character);
    frequencies[letter - 97]++;
  }
  println(frequencies);
}