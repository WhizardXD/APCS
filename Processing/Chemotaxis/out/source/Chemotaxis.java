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

public class Chemotaxis extends PApplet {

// int bacColor = color
int a, b;
Bacteria [] colony;

public void setup() {
    

    colony = new Bacteria[100];

    for (int i = 0; i < colony.length; i++) {
        colony[i] = new Bacteria();
    }
}

public void draw() {
    for (int i = 0; i < colony.length; i++) {
        colony[i].move();
        colony[i].show();
    }

}


class Bacteria {

    int myX, myY;
    int a = ((int)((Math.random()*8)-4));
    int b = ((int)((Math.random()*8)+1));


    Bacteria() {
        myX = myY = 250;
    }

    public void move() {
        a = ((int)((Math.random()*8)-4));
        b = ((int)((Math.random()*8)-4));

        myX = myX + a;
        myY = myY + b;  
    }

    public void show() {
        strokeWeight(0);
        ellipse(myX, myY, 10, 10);
    }

}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Chemotaxis" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
