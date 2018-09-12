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

public void setup() {
       
}

public void draw() {
    fadingBackground();

    if (mousePressed == true) {
        mandala();
    }
}



public void fadingBackground() {
    fill(0, 0, 0, 10);
    strokeWeight(0);

    rect(0, 0, 500, 500);

}


public void mouseDragged() {
    slinky();
}

public void mouseClicked() {
    mandala();
}


public void mandala() {
    stroke(255, 165, 0);
    noFill();
    strokeWeight(1);

    ellipse(mouseX, mouseY, 220, 220);
    ellipse(mouseX, mouseY, 187, 187);
    ellipse(mouseX, mouseY, 176, 176);
}

public void slinky() {
    stroke(140, 165, 255);
    noFill();
    strokeWeight(5);

    ellipse(mouseX, mouseY, 200, 200);
    ellipse(mouseX, mouseY, 177, 177);
    ellipse(mouseX, mouseY, 166, 166);
    
    point(mouseX, mouseY);
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "OriginalDesign" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
