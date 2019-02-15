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

public class SierpinskiTriangle extends PApplet {

public void setup() {
    
    rectMode(CENTER);
    noLoop();
}

public void draw() {
    sierpinski(250,250,300);
    line(0, 250, 500, 250);
    line(250,0,250,500);
}

public void mouseDragged() {
    redraw();
}

public void sierpinski(float x, float y, float len) {
    if (len >= 10) {
        sierpinski(x,y,len);
    } else {
        sierpinski(x,y,len - 20);
    }

    equilateralTriangle(x, y, len);
}

public void equilateralTriangle(float x, float y, float side) {
    float height  = side * (float)Math.sqrt(3)/2;
    triangle(x,y-(2*height/3),x+side/2,y+height/3,x-side/2,y+height/3);
}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SierpinskiTriangle" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
