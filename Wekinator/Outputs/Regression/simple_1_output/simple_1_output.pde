import oscP5.*;
OscP5 oscP5;
float regressionValue; 
color bg=color(0);
void setup() {
  size(600, 400);
  oscP5 = new OscP5(this, 12000);
}

void draw() {
  background(bg);
  textSize(64);
  text(regressionValue, width/2, height/2);
  bg=color(0,0,(map(regressionValue, 0, 1, 0, 255)));
  ellipse(width/3, height/2, regressionValue * 100, regressionValue * 100);
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
    regressionValue = theOscMessage.get(0).floatValue();
  }
}
