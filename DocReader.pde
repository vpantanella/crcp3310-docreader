// Tori Pantanella
// Project 1, Alice Document Reader

BufferedReader reader;
PFont arial;
final String FILENAME = "alice.txt";

int[] frequencies = new int[26];
int minFrequency = Integer.MAX_VALUE;
int maxFrequency = 0;

char leastFrequentLetter;
char mostFrequentLetter;
String possibleAlice = "";
int aliceFrequency = 0;

int state;
final int DRAW_LETTER_STATE = 0;
final int DRAW_FREQUENCIES_STATE = 1;

int [] ellipsePositionX = new int [26];
int [] ellipsePositionY = new int [26];
color [] pallette =  new color[26];


void setup() {
  size(1200, 700);
  arial= loadFont("Arial-BoldMT-48.vlw");
  textFont(arial, 12);
  prepareFrequencies();
  parseData();
  state = DRAW_LETTER_STATE;
}

void draw() {
  if (state == DRAW_LETTER_STATE) {
    textFont(arial, 12);
    drawLetterVisualization();
  } else {
    drawFrequencyGraph();
  }
}

//draw cicles with size based on frequency of letter use
void drawLetterVisualization() {
  background(255);
  text("Drawing all the letters.", 100, 100);
  for ( int i = 0; i < frequencies.length; ++i) {
    fill(pallette[i]);
    ellipse(ellipsePositionX[i], ellipsePositionY[i], frequencies[i]/10, frequencies[i]/10);
    char letter = (char)(i+97);
    fill(0);
    text(letter, ellipsePositionX[i], ellipsePositionY[i]);
  }
}

void drawFrequencyGraph() {
  background(255);
  fill(0);
  textFont(arial, 20);
  text("Number of times Alice appears: " + aliceFrequency, 50, 100);
  text("Minimum Frequency: " + minFrequency + " Letter: " + leastFrequentLetter, 50, 300);
  text("Maximum Frequency: " +  maxFrequency + " Letter: " + mostFrequentLetter, 50, 500);
  fill(#1AEACD, 30);
  rect(400, 70, aliceFrequency/2, 45);
  fill(#95FAB0, 30);
  rect(400, 270, minFrequency/2, 45);
  fill(#30CE5B, 30);
  rect(400, 470, maxFrequency/2, 45);
}


void prepareFrequencies() {
  for (int i = 0; i < 26; ++i) {
    frequencies[i] = 0;
    ellipsePositionX[i] = (int)random(width);
    ellipsePositionY[i] = (int)random(height);
    pallette[i] = color(random(50, 255), random(50, 255), random(50, 255), 150);
  }
}

void parseData() {
  reader = createReader(FILENAME);
  int character = 0;
  while (character != -1) {
    try {
      character = reader.read();
    } 
    catch (IOException e) {
      println("Could not read data.");
      e.printStackTrace();
    }
    if (!Character.isAlphabetic(character))
    {
      if (possibleAlice.compareTo("alice") == 0)
      {
        aliceFrequency++;
      }
      possibleAlice = "";
      continue;
    }
    char letter = (char)Character.toLowerCase(character);
    possibleAlice += letter;

    frequencies[letter - 97]++;
    if (frequencies[letter-97] > maxFrequency) {
      mostFrequentLetter = letter; 
      maxFrequency = frequencies[letter-97];
    }
    if (frequencies[letter-97] < minFrequency || leastFrequentLetter == letter) {
      leastFrequentLetter = letter; 
      minFrequency = frequencies[letter-97];
    }
  }
  //check
  println(frequencies);
  println("min " + minFrequency + " letter " + leastFrequentLetter);
  println("max " +  maxFrequency + " letter " + mostFrequentLetter);
  println("Alice: " + aliceFrequency);
  println(possibleAlice);
}

void mousePressed() {
  state = (state + 1) % 2;
}