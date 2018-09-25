import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Lightning extends PApplet {

int startX = 250;
int startY = 0;
int endX = 0;
int endY = 250;


public void setup() {
    

    strokeWeight(1);
    background(255,255,0);

    noLoop();
}

public void draw() {
    while (startY < 500) {
        int a = 10*((int)((Math.random()*8)-4));
        int b = 10*((int)((Math.random()*8)+1));

        fill(0,0,0);
        line(startX, startY, (startX + a), (startY + b));
        startX = startX + a;
        startY = startY + b;

        // a = 10*((int)((Math.random()*8)-4));

    }
}


public void mousePressed() {
    redraw();
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lightning" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
