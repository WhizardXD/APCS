//your variable declarations here
public void setup() {
    size(500, 500);
}

public void draw() {
    //your code here
}


class Spaceship extends Floater {
    
    // private int myX, myY;

    public Spaceship() {
        corners = 3;
        xCorners = new int[corners];
        yCorners = new int[corners];

        myCenterX = myCenterY = 250;
        myPointDirection = 270;
        myDirectionX = myDirectionY = 0;
        
        myColor = color(255,0,150);
    }

    public void setX(int x) {myCenterX = x;}
    public double getX() {return myCenterX;}
    public void setDirectionX(double x) {myDirectionX = x;}
    public double getDirectionX() {return myDirectionX;}

    public void setY(int y) {myCenterY = y;}
    public double getY() {return myCenterY;}
    public void setDirectionY(double y) {myDirectionY = y;}
    public double getDirectionY() {return myDirectionY;}

    public void setPointDirection(double degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}

}

class Star /*note that this class does NOT extend Floater*/ {
  //your code here
}


//Do NOT modify the Floater class! Make changes in the Spaceship class
abstract class Floater {
    protected int corners;  //the number of corners, a triangular floater has 3
    protected int[] xCorners;
    protected int[] yCorners;
    protected int myColor;
    protected double myCenterX, myCenterY; //holds center coordinates
    protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel
    protected double myPointDirection; //holds current direction the ship is pointing in degrees

    abstract public void setX(int x);
    abstract public double getX();
    abstract public void setY(int y);
    abstract public double getY();
    abstract public void setDirectionX(double x);
    abstract public double getDirectionX();
    abstract public void setDirectionY(double y);
    abstract public double getDirectionY();
    abstract public void setPointDirection(double degrees);
    abstract public double getPointDirection();

    //Accelerates the floater in the direction it is pointing (myPointDirection)
    public void accelerate (double dAmount) {
        //convert the current direction the floater is pointing to radians
        double dRadians = myPointDirection*(Math.PI/180);
        //change coordinates of direction of travel
        myDirectionX += ((dAmount) * Math.cos(dRadians));
        myDirectionY += ((dAmount) * Math.sin(dRadians));
    }

    public void turn (int nDegreesOfRotation) {
        //rotates the floater by a given number of degrees
        myPointDirection += nDegreesOfRotation;
    }

    //move the floater in the current direction of travel
    public void move () {
        //change the x and y coordinates by myDirectionX and myDirectionY
        myCenterX += myDirectionX;
        myCenterY += myDirectionY;

        //wrap around screen
        if (myCenterX >width) {
            myCenterX = 0;
        } else if (myCenterX<0) {
            myCenterX = width;
        }

        if(myCenterY >height) {
            myCenterY = 0;
        } else if (myCenterY < 0) {
            myCenterY = height;
        }
    }

    //Draws the floater at the current position
    public void show () {
        fill(myColor);
        stroke(myColor);

        //translate the (x,y) center of the ship to the correct position
        translate((float)myCenterX, (float)myCenterY);

        //convert degrees to radians for rotate()
        float dRadians = (float)(myPointDirection*(Math.PI/180));

        //rotate so that the polygon will be drawn in the correct direction
        rotate(dRadians);

        //draw the polygon
        beginShape();
        for (int nI = 0; nI < corners; nI++) {
            vertex(xCorners[nI], yCorners[nI]);
        }
        endShape(CLOSE);

        //"unrotate" and "untranslate" in reverse order
        rotate(-1*dRadians);
        translate(-1*(float)myCenterX, -1*(float)myCenterY);
    }
}