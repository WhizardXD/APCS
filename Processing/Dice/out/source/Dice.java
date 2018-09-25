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

public class Dice extends PApplet {

public void setup() {
    
	noLoop();
}

public void draw() {
    background(197);
}

public void mousePressed() {
	redraw();
}


class Die {//models one single dice cube

	//variable declarations here
	
	Die(int x, int y) {
        //constructor
		//variable initializations here
	}

	public void roll() {
		//your code here
	}

	public void show() {
		//your code here
	}
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Dice" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
