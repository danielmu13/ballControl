//added frame rate, color picker, data flow, textfield and textarea as ui component
import controlP5.*;

ControlP5 cp5;
    ColorPicker cp;
    int v1;
    Chart myChart;
    Textarea myTextarea;

int gray = 0;
int frame = 0;
boolean drawT = false;
float x;
float y;
float easing = 0.05;
String textValue = "";

void setup() {
  size(800, 400);    
  PFont font = createFont("arial",20);
  strokeWeight(4);  
  frameRate(60);
      noStroke();
      cp5 = new ControlP5(this);
      cp5.addFrameRate().setInterval(10).setPosition(0,height - 10);
      
         
         cp = cp5.addColorPicker("picker")
          .setPosition(60, 345)
          .setColorValue(color(255, 128, 0, 128))
          ;
          
          myChart = cp5.addChart("dataflow")
               .setPosition(50, 220)
               .setSize(200, 100)
               .setRange(-20, 20)
               .setView(Chart.LINE) // use Chart.LINE, Chart.PIE, Chart.AREA, Chart.BAR_CENTERED
               .setStrokeWeight(1.5)
               .setColorCaptionLabel(color(40))
               ;
               
               myChart.addDataSet("incoming");
  myChart.setData("incoming", new float[100]);
  
  cp5.addTextfield("input")
     .setPosition(600,20)
     .setSize(150,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
  
  textFont(font);
  myTextarea = cp5.addTextarea("txt")
                  .setPosition(390,80)
                  .setSize(200,200)
                  .setFont(createFont("arial",12))
                  .setLineHeight(14)
                  .setColor(color(128))
                  .setColorBackground(color(255,100))
                  .setColorForeground(color(255,100));
                  ;
  myTextarea.setText("Lorem Ipsum is simply dummy text of the printing and typesetting"
                    +" industry. Lorem Ipsum has been the industry's standard dummy text"
                    +" ever since the 1500s, when an unknown printer took a galley of type"
                    +" and scrambled it to make a type specimen book. It has survived not"
                    +" only five centuries, but also the leap into electronic typesetting,"
                    +" remaining essentially unchanged. It was popularised in the 1960s"
                    +" with the release of Letraset sheets containing Lorem Ipsum passages,"
                    +" and more recently with desktop publishing software like Aldus"
                    +" PageMaker including versions of Lorem Ipsum."
                    );
      cp5.addSlider("changeWidth")
     .setRange(100,400)
     .setValue(200)
     .setPosition(400,20)
     .setSize(100,19)
     ;
     
  cp5.addSlider("changeHeight")
     .setRange(100,400)
     .setValue(200)
     .setPosition(400,40)
     .setSize(100,19)
     ;
}

void draw() { 
  background(251);
  background(gray);  
  background(200, 200, 200);
      background(cp.getColorValue());
      myChart.push("incoming", (sin(frameCount*0.1)*10));
  text(cp5.get(Textfield.class,"input").getText(), 600,130);
  
  
  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;
  
  ellipse(x, y, 66, 66);
  frameRate(20);//mouse data
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
    public void controlEvent(ControlEvent c) {
  // when a value change from a ColorPicker is received, extract the ARGB values
  // from the controller's array value
  if(c.isFrom(cp)) {
    int r = int(c.getArrayValue(0));
    int g = int(c.getArrayValue(1));
    int b = int(c.getArrayValue(2));
    int a = int(c.getArrayValue(3));
    color col = color(r,g,b,a);
    println("event \talpha:"+a+"\tred:"+r+"\tgreen:"+g+"\tblue:"+b+"\tcol"+col);
  }
  
  if(keyPressed && key==' ') {
    myTextarea.scroll((float)mouseX/(float)width);
  }
  if(keyPressed && key=='l') {
    myTextarea.setLineHeight(mouseY);
  }
}

void picker(int col) {
  println("picker\talpha:"+int(alpha(col))+"\tred:"+int(red(col))+"\tgreen:"+int(green(col))+"\tblue:"+int(blue(col))+"\tcol"+col);
}
  


void mousePressed() { //Mouse Events
  gray += 250;
  loop();
  frame = 0;
  switch(key) {
    case('1'):
    // method A to change color
    cp.setArrayValue(new float[] {120, 0, 120, 255});
    break;
    case('2'):
    // method B to change color
    cp.setColorValue(color(255, 0, 0, 255));
    break;
  
}  

}
  
void mouseReleased() { //Mouse Events
  gray += 250;
  
}
  
void keyPressed() { // keyPressed
  if ((key == 'T') || (key == 't')) {
    drawT = true;
    if(key=='r') {
    myTextarea.setText("Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                      +" Quisque sed velit nec eros scelerisque adipiscing vitae eu sem."
                      +" Quisque malesuada interdum lectus. Pellentesque pellentesque molestie"
                      +" vestibulum. Maecenas ultricies, neque at porttitor lacinia, tellus enim"
                      +" suscipit tortor, ut dapibus orci lorem non ipsum. Mauris ut velit velit."
                      +" Fusce at purus in augue semper tincidunt imperdiet sit amet eros."
                      +" Vestibulum nunc diam, fringilla vitae tristique ut, viverra ut felis."
                      +" Proin aliquet turpis ornare leo aliquam dapibus. Integer dui nisi, condimentum"
                      +" ut sagittis non, fringilla vestibulum sapien. Sed ullamcorper libero et massa"
                      +" congue in facilisis mauris lobortis. Fusce cursus risus sit amet leo imperdiet"
                      +" lacinia faucibus turpis tempus. Pellentesque pellentesque augue sed purus varius"
                      +" sed volutpat dui rhoncus. Lorem ipsum dolor sit amet, consectetur adipiscing elit"
                      );
                      
  } else if(key=='c') {
    myTextarea.setColor(0xffffffff);
  }
  }
}

void keyReleased() {// KeyReleased
  drawT = false;
  
}

void changeWidth(int theValue) {
  myTextarea.setWidth(theValue);
}

void changeHeight(int theValue) {
  myTextarea.setHeight(theValue);
  
}