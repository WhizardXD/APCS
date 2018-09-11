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

public class Clover extends PApplet {

public void setup() {
    
}

public void draw() {
    int x = 0;
    int y = 0;
    while (x <= 1000 && x <= 1000) {
        clover(x,0);
        clover(0,y);
        x = x + 150;
        clover(x,0);
        y = y + 150;
        clover(0,y);

        // fill(255, 9, 46);
        
        
    }

}

public void clover(int a, int b) {
    ellipse(a+50, b+50, 50, 50);
    ellipse(a+100, b+50, 50, 50);
    ellipse(a+50, b+100, 50, 50);
    ellipse(a+100, b+100, 50, 50);
}
  public void settings() {  size(1000,1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Clover" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
