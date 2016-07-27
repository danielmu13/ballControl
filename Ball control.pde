int gray = 0;
int frame = 0;
boolean drawT = false;
float x;
float y;
float easing = 0.05;

void setup() {
  size(640, 360);    
  strokeWeight(4);  
  
}

void draw() { 
  background(251);
  background(gray);  
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  ellipse(x, y, 66, 66);
  frameRate(12);//mouse data
  println(mouseX + " : " + mouseY);
  if (mouseButton == LEFT) { //mousebutton
    fill(0); // Black
  } else if (mouseButton == RIGHT) {
    fill(255); // White
  } else { 
    fill(126); // Gray
  } 
  if (keyPressed == true) { //keyboard data
    line(20, 20, 80, 80); // draw a line
  } else { // Otherwise,
    rect(40, 40, 20, 20); // draw a rectangle
  } 
  line(10, 50, 90, 50);
  if (key == CODED) { //coded keys
    if (keyCode == UP) {
      y = 20;
    } else if (keyCode == DOWN) {
      y = 50;
    }
  } else {
    y = 35;
  }
  rect(25, y, 50, 30);// Key events
   if (drawT == true) { 
    rect(120, 20, 60, 20);
    rect(139, 40, 22, 45);
   }
   
   if (mousePressed == true) { // Cursor iron
    cursor(HAND); // Draw cursor as hand
  } else {
    cursor(CROSS);
  }
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, height, mouseY);
   
  if (frame > 50) { // Event flow // If 120 frames since the mouse
  background(0); // and turn the background black.
  } else { // Otherwise, set the background   
    frame++;
  }
  
}

void mousePressed() { //Mouse Events
  gray += 250;
  loop();
  frame = 0;
  
}  
  
void mouseReleased() { //Mouse Events
  gray += 250;
  
}
  
void keyPressed() { // keyPressed
  if ((key == 'T') || (key == 't')) {
    drawT = true;
  }
}

void keyReleased() {// KeyReleased
  drawT = false;
  
}
  