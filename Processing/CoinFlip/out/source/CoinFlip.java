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

public class CoinFlip extends PApplet {

public void setup()
{
  
  textAlign(CENTER,CENTER);
  noLoop();
}
public void draw()
{
}
class Coin
{
  //three member variables
  boolean heads; 
  int myX, myY;

  //three member functions
  Coin(int x, int y) //constructor
  {
    //java code
  }
  public void flip()
  {
    //java code
  }
  public void show()
  {
    //java code
  }
} 
  public void settings() {  size(500, 300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CoinFlip" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
