import oscP5.*;
OscP5 oscP5;
int currentClass; 
PFont font;
String word="OBJECT";
color bg = color(0);

void setup() {
  size(640, 480);
  oscP5 = new OscP5(this, 12000);
  font = loadFont("SourceCodePro-Bold-72.vlw");
  textFont(font, 72);
  textAlign(CENTER);
}

void draw() {
  background(bg);
  textSize(64);
  text(currentClass, width/2, height/2);
  
  
  //text(word, width/2, 400);
  if (currentClass == 1) {
    //Do something on class 1
    bg=color(255,0,0);
    //word="PERSON";
  } else if (currentClass == 2) {
    //Do something else on class 2
    bg=color(0,255,0);
    //word="CHAIR";
  } else {
    //Else do this
    bg=color(0,0,255);
    //word="OBJECT";
  }
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
    currentClass = (int) theOscMessage.get(0).floatValue();
  }
}
