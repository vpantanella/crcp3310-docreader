// Tori Pantanella
// Project 1, Document Reader

BufferedReader reader;
final String FILENAME = "alice.txt";
int[] frequencies = new int[26];
int minFrequency = MIN_INT;
int maxFrequency = MAX_INT;

int state;
final int DRAW_LETTER_STATE = 0;
final int DRAW_FREQUENCIES_STATE = 1;

void setup() {
  size(400, 400);
  prepareFrequencies();
  parseData();
  state = DRAW_LETTER_STATE;
 // determineMinAndMax(); // pick and print the min/max
}

void draw() {
  if (state == DRAW_LETTER_STATE){
    drawLetterVisualization();
  }else{
    drawFrequencyGraph();
  }
  //for every Nth character I have, color the Nth puxel with the Nth color.
  
}

void drawLetterVisualization(){
  background(0);
  text("Drawing all the letters.", 100, 100);
}

void drawFrequencyGraph(){
  background(0);
  text("Bar Graph here.", 100, 100);
}

//void determineMinAndMax(){
//  if (character > maxFrequency){
//    maxFrequency = character;
//  }
  
 // }

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
//}if (frequencies > 0)
}

void mousePressed(){
  state = (state + 1) % 2;
}