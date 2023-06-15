float planeRotationX = 0;
float planeRotationY = 0;
String message = "Hold and drag your mouse";
color planeColor = color(200);
char planeLetter = ' ';
int flashDuration = 0;

void setup() {
  size(600, 400, P3D);
}

void draw() {
  background(255);
  
  if (flashDuration > 0) {
    // display a flashing background
    float flashAlpha = map(flashDuration, 0, 60, 0, 255);
    fill(planeColor, flashAlpha);
    rect(0, 0, width, height);
    translate(0,0,110);
    flashDuration--;
  }

  if (message != "") {
    textAlign(CENTER, CENTER);
    textSize(16);
    fill(0);
    text(message, width/2, height - 30);
  }
  
  translate(width/2, height/2, 0);
  rotateX(planeRotationX);
  rotateY(planeRotationY);
  stroke(0);
  fill(planeColor);
  beginShape(QUADS);
  vertex(-100, -100, 0);
  vertex(100, -100, 0);
  vertex(100, 100, 0);
  vertex(-100, 100, 0);
  endShape();
  
  if (key != CODED && key != 0) {
    textAlign(CENTER, CENTER);
    textSize(150);
    fill(255);
    text(key, 0, 0);
  }
}


void mouseDragged() {
  planeRotationY += (mouseX - pmouseX) * 0.01;
  planeRotationX += (mouseY - pmouseY) * 0.01;
  if (message != "") message = "Press a letter on your keyboard";
}

void keyPressed() {
  message = "";
  int letterValue = int(key);
  letterValue = (letterValue >= 97 && letterValue <= 122) ? letterValue - 32 : letterValue;
  if (letterValue >= 65 && letterValue <= 90) {
    int x = (letterValue * 31) % 255;
    int y = (letterValue * 71) % 255;
    int z = (letterValue * 127) % 255;
    planeColor = color(x, y, z);
    planeLetter = key;
    flashDuration = 50;
  }
}
