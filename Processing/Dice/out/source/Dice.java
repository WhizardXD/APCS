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

	Die bob1 = new Die(mouseX,mouseY);
	bob1.show();
}

public void mousePressed() {
	redraw();
}


class Die {//models one single dice cube

	int myX, myY; 
	int rollNum = (int)(Math.random()*6)+1;
	int rotAte = (int)(Math.random()*2)+1;
	
	Die(int x, int y) {
        //constructor
		myX = x;
		myY = y;
	}

	public void roll() {
		rollNum = (int)(Math.random()*6)+1;
	}


	public void show() {
		fill(255, 255, 255);
		rect(myX - 24, myY - 24, 48, 48);

		if (rollNum == 1) {
			fill(0, 0, 0);
			ellipse(myX, myY, 6, 6);
		} else if (rollNum == 2) {
			fill(0, 0, 0);
			ellipse(myX - 10, myY - 10, 6, 6);
			ellipse(myX + 10, myY + 10, 6, 6);
		} else if (rollNum == 3) {
			fill(0, 0, 0);
			ellipse(myX, myY, 6, 6);
			ellipse(myX - 12, myY - 12, 6, 6);
			ellipse(myX + 12, myY + 12, 6, 6);		
		} else if (rollNum == 4) {
			fill(0, 0, 0);
			ellipse(myX - 10, myY - 10, 6, 6);
			ellipse(myX + 10, myY + 10, 6, 6);
			ellipse(myX - 10, myY + 10, 6, 6);
			ellipse(myX + 10, myY - 10, 6, 6);
		} else if (rollNum == 5) {
			fill(0, 0, 0);
			ellipse(myX, myY, 6, 6);
			ellipse(myX - 12, myY - 12, 6, 6);
			ellipse(myX + 12, myY + 12, 6, 6);
			ellipse(myX - 12, myY + 12, 6, 6);
			ellipse(myX + 12, myY - 12, 6, 6);
		} else if (rollNum == 6) {
			rotAte = (int)(Math.random()*2)+1;
			if (rotAte == 1) {
				fill(0, 0, 0);
				ellipse(myX - 11, myY - 11, 6, 6);
				ellipse(myX + 11, myY + 11, 6, 6);
				ellipse(myX - 11, myY + 11, 6, 6);
				ellipse(myX + 11, myY - 11, 6, 6);
				ellipse(myX + 11, myY, 6, 6);
				ellipse(myX - 11, myY, 6, 6);
			} else {
				fill(0, 0, 0);
				ellipse(myX - 11, myY - 11, 6, 6);
				ellipse(myX + 11, myY + 11, 6, 6);
				ellipse(myX - 11, myY + 11, 6, 6);
				ellipse(myX + 11, myY - 11, 6, 6);
				ellipse(myX, myY + 11, 6, 6);
				ellipse(myX, myY - 11, 6, 6);

			}
		}











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
