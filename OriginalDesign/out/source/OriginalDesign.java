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

public class OriginalDesign extends PApplet {

int x = mouseX;
int y = mouseY;

public void setup() {
       
}

public void draw() {
    fill(0, 0, 0, 10);
    rect(0, 0, 1000, 1000);
}

public void mouseDragged() {
    mandala(x,y);
}

public void mouseClicked() {
    mandala(x,y);
}

public void mandala(int a, int b) {
    stroke(255, 165, 0);
    noFill();

    ellipse(mouseX, mouseY, 200, 200);
    ellipse(mouseX, mouseY, 187, 187);
    ellipse(mouseX, mouseY, 176, 176);
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "OriginalDesign" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
