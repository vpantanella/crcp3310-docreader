BufferedReader reader;
String alice;

void setup(){
  size(400, 400);
  reader = createReader("Alice.txt");
}

void draw(){
  try{
    alice = reader.readLine();
  } catch (IOException e){
    e.printStackTrace();
    alice = null;
  }
  if (alice == null){
    noLoop();
  }else {
    String[] pieces = split(alice, TAB);
    int x = int(pieces[0]);
    int y = int(pieces[1]);
    point(x,y);
  }
}