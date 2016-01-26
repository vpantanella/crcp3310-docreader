// check for non numeric characters
String [] m = match(alice, \w *);
if (m = null){
  //do nothing;
}else{
  int [] i = int(alice.toCharArray());
  