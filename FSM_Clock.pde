//Inspired by Example Clock from: http://processing.org/examples/clock.html
//Modified with a background image by Forrest Lee Erickson April 20, 2015.
//Clock background FSM.
//Free to copy. Crediting me would be nice but not neccessary.
//May you be touched.


//Global Variable Decleration.

//Clock variables
int cx, cy;    //Center of clock dial
float secondsRadius;
float minutesRadius;
float hoursRadius;
float clockDiameter;
int lastsecond = -2;
int  grandfathercolor = 255;  //Background of the clock

//Background iamge
PImage img;  // Declare global variable "a" of type PImage
PFont f;                          // Declare global PFont variable


void setup() {
   // The image file must be in the data folder of the current sketch 
  // to load successfully
  img = loadImage("TouchedBHNA.jpg");  // Load the FSM image into the program 
  f = createFont("Arial",6,true);     // Create Font 
  textAlign(RIGHT);                    // Credit will be in lower right corner.
  
//The clock frame
  size(634, 319);                        //Size of the FSM image.
  stroke(255);

  int radius = min(width, height) / 2;
  secondsRadius = radius * 0.85;
  minutesRadius = radius * 0.70;
  hoursRadius = radius * 0.50;
  clockDiameter = radius * 1.8;
  
  cx = width / 2;
  cy = height / 2;


  
}

void draw() {
//  background(grandfathercolor);
  image(img, 0, 0);
  fill(0);
  textFont(f,6);                 // STEP 4 Specify font to be used
  text("May you be touched!  F. Lee Erickson",625, 310);
  
  // Draw the clock background
  fill(grandfathercolor,50);
  stroke(1);
  ellipse(cx, cy, clockDiameter, clockDiameter);
  
  // Angles for sin() and cos() start at 3 o'clock;
  // subtract HALF_PI to make them start at the top
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  // Draw the hands of the clock
  stroke(255, 0, 0);
  strokeWeight(2);
  line(cx, cy, cx + cos(s) * secondsRadius, cy + sin(s) * secondsRadius);
  stroke(0, 0, 255);
  strokeWeight(4);
  line(cx, cy, cx + cos(m) * minutesRadius, cy + sin(m) * minutesRadius);
  stroke(64, 64, 128);
  strokeWeight(6);
  line(cx, cy, cx + cos(h) * hoursRadius, cy + sin(h) * hoursRadius);
  
  // Draw the minute ticks
  strokeWeight(2);
  stroke(0);
  beginShape(POINTS);
  for (int a = 0; a < 360; a+=6) {
    float angle = radians(a);
    float x = cx + cos(angle) * secondsRadius *0.95;
    float y = cy + sin(angle) * secondsRadius *0.95;
    vertex(x, y);
  }
  
  //Send Time Every Second. Compair against last second sent or > 60 and send again.
  if (lastsecond != second()) {
      lastsecond = second();
    println("Hr:Min:Seconds = " +hour()+":"+ minute() +":"+lastsecond);
        }
  
  endShape();
}





