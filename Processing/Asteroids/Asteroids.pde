//your variable declarations here
Spaceship wing = new Spaceship();
Star[] drop;
ArrayList <Asteroid> rock;
ArrayList <Bullet> shot;

boolean w, a, d, space = false;


public void setup() {
    frameRate(60);
    // noLoop();
    // fullScreen();
    size(500, 700);
    drop = new Star[300];
    rock = new ArrayList <Asteroid>();
    shot = new ArrayList <Bullet>();
    
    for (int j = 0; j < 15; j++) {
        rock.add(new Asteroid());
    }

    for (int i = 0; i < drop.length; i++) {
        drop[i] = new Star();
        drop[i].setX(Math.random()*500);
        drop[i].setY(Math.random()*500);
        drop[i].setOpac((int)(Math.random()*156) + 100);
    }


}

public void draw() {
    fill(0, 0, 0);
    rect(0, 0, 500, 500);

    for (int i = 0; i < drop.length; i++) {
        drop[i].show();
        drop[i].twinkle();
    }

    wing.show();
    wing.move();

    for (int j = 0; j < rock.size(); j++) {
        rock.get(j).show();
        rock.get(j).move();

        if (dist((float)wing.getX(), (float)wing.getY(), (float)rock.get(j).getX(), (float)rock.get(j).getY()) <= 20) {
            rock.remove(j);
        }
    }

    for (int k = 0; k < shot.size(); k++) {
        shot.get(k).show();
        shot.get(k).move();
    }

    for (int m = 0; m < rock.size(); m++) {
        for (int n = 0; n < shot.size(); n++) {
            if (dist((float)rock.get(m).getX(), (float)rock.get(m).getY(), (float)shot.get(n).getX(), (float)shot.get(n).getY()) < 20) {
                shot.remove(n);
                rock.remove(m);
                break;
            }
        }
    }


    fill(255, 120, 50);
    rect(0, 500, 500, 200);

	textSize(15);
    fill(0, 255, 0);
	text("Current Position: " + nf((float)wing.getX(), 0, 2) + ", " + nf((float)wing.getY(), 0, 2), 115, 550);

	textSize(15);
    fill(0, 255, 0);
	text("Speed: " + wing.calVelocity(wing.getVelX(), wing.getVelY()) + " m/s", 115, 600);

    fill(255, 0, 0);
    rect(350, 580, 50, 25);
    if (mousePressed) {
        if (mouseX > 350 && mouseX < 400 && mouseY > 580 && mouseY < 605) {
            fill(0, 255, 0);
            rect(350, 580, 50, 25);
            wing.setVelX(0);
            wing.setVelY(0);
        }
    }

	textSize(15);
    fill(0, 255, 0);
	text("Rotation left: " + wing.calRotateLeft(wing.myDirection) + " m/s", 115, 650);
	text("Rotation right: " + wing.calRotateRight(wing.myDirection) + " m/s", 115, 670);

    fill(255, 0, 0);
    rect(350, 640, 50, 25);
    if (mousePressed) {
        if (mouseX > 350 && mouseX < 400 && mouseY > 640 && mouseY < 665) {
            fill(0, 255, 0);
            rect(350, 640, 50, 25);
            wing.setDirection(0);
        }
    }

	// textSize(15);
    // fill(0, 255, 0);    
    // text("Magnitude of acceleration: " + wing.calAccel(wing.getAccelX(), wing.getAccelY()) + " m/s2", 115, 650);
    // text("Acceleration magnitude: " + )
    // println(wing.myDirection);
    // println(w);
}

/*



*/

public void keyPressed() {
    if (key == 'w') {
        wing.accelerate(0.05);
        w = true;
    }
    if (w == true && (a == true || d == true || space == true)) {
        wing.accelerate(0.05);
    }

    if (key == 'a') {
        wing.turn(-0.05);
        a = true;
    }
    if (a == true && (w == true || d == true || space == true)) {
        wing.turn(-0.05);
    }

    if (key == 'd') {
        wing.turn(0.05);
        d = true;
    }
    if (d == true && (w == true || a == true || space == true)) {
        wing.turn(0.05);
    }

    if (key == ' ') {
        shot.add(new Bullet(wing));
        space = true;
    }
    if (space == true && (w == true || a == true || d == true)) {
        shot.add(new Bullet(wing));
    }

    if (keyCode == SHIFT) {
        wing.setX(Math.random()*500);
        wing.setY(Math.random()*500);
        wing.setVelX(0);
        wing.setVelY(0);
        wing.setPointDirection(Math.random()*361);
        wing.setDirection(0);
    }


}

public void keyReleased() {
    if (key == 'w' && w == true) {
        w = false;
    }
    if (key == 'a' && a == true) {
        a = false;
    }
    if (key == 'd' && d == true) {
        d = false;
    }
    if (key == ' ' && space == true) {
        space = false;
    }
}



class Spaceship extends Floater {
    // private int myX, myY;

    public Spaceship() {
        corners = 4;
        xCorners = new int[corners];
        yCorners = new int[corners];
        xCorners[0] = -8;
        yCorners[0] = -8;
        xCorners[1] = 16;
        yCorners[1] = 0;
        xCorners[2] = -8;
        yCorners[2] = 8;

        myCenterX = myCenterY = 250;
        myVelCompX = myVelCompY = 0;
        myAccelCompX = myAccelCompY = 0;
        myPointDirection = 270;
        myDirection = 0;
        
        myColor = color(255,0,150);
    }

    public void setX(double x) {myCenterX = x;}
    public double getX() {return myCenterX;}

    public void setY(double y) {myCenterY = y;}
    public double getY() {return myCenterY;}

    public int getTipX() {return xCorners[0];}
    public int getTipY() {return yCorners[0];}

    public void setDirection(double d) {myDirection = d;}
    public double getDirection() {return myDirection;}

    public void setPointDirection(double degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}

    public void setVelX(double v) {myVelCompX = v;}
    public double getVelX() {return myVelCompX;}

    public void setVelY(double u) {myVelCompY = u;}
    public double getVelY() {return myVelCompY;}


    public String calVelocity(double velX, double velY) { 
        double velMag = Math.sqrt(Math.pow(velX,2) + Math.pow(velY,2));
        String velRes = nf((float)velMag, 0, 2);
        return velRes;
    }

    public String calRotateLeft(double rotatingLeft) {
        if (rotatingLeft <= 0) {
            double leftRotate = Math.abs(rotatingLeft);
            String leftTurn = nf((float)leftRotate, 0, 2);
            return leftTurn;
        } else {
            return "0.00";
        }
    }

    public String calRotateRight(double rotatingRight) {
        if (rotatingRight >= 0) {
            String rightTurn = nf((float)rotatingRight, 0, 2);
            return rightTurn;
        } else {
            return "0.00";
        }
    }


    public void move() {
        //change the x and y coordinates by myDirectionX and myDirectionY
        myCenterX += myVelCompX;
        myCenterY += myVelCompY;

        myPointDirection += myDirection;


        //wrap around screen
        if (myCenterX > width) {
            myCenterX = 0;
            setup();
        } else if (myCenterX < 0) {
            myCenterX = width;
            setup();
        }

        if (myCenterY > height) {
            myCenterY = 0;
            setup();
        } else if (myCenterY < 0) {
            myCenterY = height;
            setup();
        }
    }

    public void show() {
        // super.show();

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

        if (w == true) {
            strokeWeight(3);
            
            stroke(0, 0, 255);
            line(-12,-4,-22,-6);
            line(-12,0,-22,0);
            line(-12,4,-22,6);

            stroke(myColor);
            strokeWeight(1);
        }

        if (a == true) {
            strokeWeight(2);
            
            stroke(0, 0, 255);
            line(14,7,16,14);
            line(12,7,12,14);
            line(10,7,8,14);

            stroke(myColor);
            strokeWeight(1);
        }

        if (d == true) {
            strokeWeight(2);
            
            stroke(0, 0, 255);
            line(14,-7,16,-14);
            line(12,-7,12,-14);
            line(10,-7,8,-14);

            stroke(myColor);
            strokeWeight(1);
        }


        //"unrotate" and "untranslate" in reverse order
        rotate(-1*dRadians);
        translate(-1*(float)myCenterX, -1*(float)myCenterY);

    }
}

class Star {
    //your code here
    private double myX, myY;
    private float opac;
    private boolean set;
    private float len, weight;
    // private PShape star;

    public Star() {
        myX = myY = 0;
        // opac = 0;
        set = true;
    }

    public void setX(double x) {myX = x;}
    public void setY(double y) {myY = y;}

    public void setOpac(float o) {opac = o;}
    public void setLen(float l) {len = l;}
    public void setWeight(float w) {weight = w;}

    public void twinkle() {
        // opac = starting;
        if (set == true) {
            opac += 1;
        } 
        if (set == false) {
            opac -= 1;
        }
        if (opac >= 255) {
            set = false;
        } else if (opac <= 100) {
            set = true;
        }

        
        // if (set == true) {
        //     len = 0.05
        // }





    }

    public void show() {
        // filter(BLUR, 1);

        noStroke();
        fill(255, 255, 255, opac);
        ellipse((float)myX, (float)myY, 5, 5);

        /*
        stroke(255, 255, 255, opac);
        strokeCap(ROUND);
        strokeWeight(weight);
        line((float)myX - len, (float)myY, (float)myX + len, (float)myY);
        line((float)myX, (float)myY - len, (float)myX, (float)myY + len);
        */

        



    }
}

class Asteroid extends Floater {
    
    protected double rotationSpeed;
    protected int[] asteroidOneX, asteroidOneY;
    protected int[] asteroidTwoX, asteroidTwoY;
    protected int ran;

    public Asteroid() {
        corners = 8;
        xCorners = new int[corners];
        yCorners = new int[corners];
        asteroidOneX = new int[]{16,15,15,14,15,20,19,14};
        asteroidOneY = new int[]{13,16,21,18,10,19,22,16};
        asteroidTwoX = new int[]{10,19,22,16,13,16,21,18};
        asteroidTwoY = new int[]{15,20,19,14,10,19,22,16};
        ran = (int)(Math.random()*2);
        // println(ran);
        if (ran == 0) {
            for (int i = 0; i < corners; i++) {
                xCorners[i] = 10*(asteroidOneX[i]-15);
                yCorners[i] = 10*(asteroidOneY[i]-15);
                // println("x" + i + ": " + xCorners[i]);
                // println("y" + i + ": " + yCorners[i]);
            }
        } else if (ran == 1) {
            for (int i = 0; i < corners; i++) {
                xCorners[i] = 10*(asteroidTwoX[i]-15);
                yCorners[i] = 10*(asteroidTwoY[i]-15);
                // println("x" + i + ": " + xCorners[i]);
                // println("y" + i + ": " + yCorners[i]);
            }
        }

        myCenterX = Math.random()*500;
        myCenterY = Math.random()*500;
        myVelCompX = (Math.random()*3)-1;
        myVelCompY = (Math.random()*3)-1;
        myPointDirection = 0;
        // myDirection = Math.random()*361;
        
        myColor = color(255,255,150);
        
        rotationSpeed = (Math.random()*9)-5;
    }


    public void setX(double x) {myCenterX = x;}
    public double getX() {return myCenterX;}

    public void setY(double y) {myCenterY = y;}
    public double getY() {return myCenterY;}

    public void setDirection(double d) {myDirection = d;}
    public double getDirection() {return myDirection;}

    public void setPointDirection(double degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}


    public void move() {
        // turn(rotationSpeed);
        super.move();
        //myCenterX += myVelCompX;
        //myCenterY += myVelCompY;
        myPointDirection += rotationSpeed;
        // println(myPointDirection);
    }
}

class Bullet extends Floater {

    public Bullet(Spaceship theShip) {
        myCenterX = theShip.getX();
        myCenterY = theShip.getY() + theShip.getTipY();
        myPointDirection = theShip.getPointDirection();
        double dRadians = myPointDirection * (Math.PI/180);
        myVelCompX = 5 * Math.cos(dRadians) + theShip.getVelX();
        myVelCompY = 5 * Math.sin(dRadians) + theShip.getVelY();
        myAccelCompX = myAccelCompY = 0;

        myColor = color(255,0,150);
    }

    public void setX(double x) {myCenterX = x;}
    public double getX() {return myCenterX;}

    public void setY(double y) {myCenterY = y;}
    public double getY() {return myCenterY;}

    public void setDirection(double d) {myDirection = d;}
    public double getDirection() {return myDirection;}

    public void setPointDirection(double degrees) {myPointDirection = degrees;}
    public double getPointDirection() {return myPointDirection;}


    public void show() {
        fill(0,0,255);
        strokeWeight(0);
        ellipse((float)myCenterX, (float)myCenterY, 3.5, 3.5);
    }
}


//Do NOT modify the Floater class! Make changes in the Spaceship class
abstract class Floater {
    protected int corners;  //the number of corners, a triangular floater has 3
    protected int[] xCorners;
    protected int[] yCorners;
    protected int myColor;
    protected double myCenterX, myCenterY; //holds center coordinates
    protected double myVelCompX, myVelCompY;
    protected double myAccelCompX, myAccelCompY; //holds x and y coordinates of the vector for direction of travel
    protected double myDirection; //
    protected double myRotateAccel;
    protected double myPointDirection; //holds current direction the ship is pointing in degrees

    abstract public void setX(double x);
    abstract public double getX();
    abstract public void setY(double y);
    abstract public double getY();
    abstract public void setDirection(double d);
    abstract public double getDirection();
    abstract public void setPointDirection(double degrees);
    abstract public double getPointDirection();

    //Accelerates the floater in the direction it is pointing (myPointDirection)
    public void accelerate(double dAmount) {
        //convert the current direction the floater is pointing to radians
        double dRadians = myPointDirection*(Math.PI/180);
        //change coordinates of direction of travel
        myAccelCompX = ((dAmount) * Math.cos(dRadians));
        myAccelCompY = ((dAmount) * Math.sin(dRadians));

        myVelCompX += myAccelCompX;
        myVelCompY += myAccelCompY;
    }

    public void turn(double nDegreesOfRotation) {
        //rotates the floater by a given number of degrees
        myRotateAccel = nDegreesOfRotation;
        myDirection += myRotateAccel;
    }

    //move the floater in the current direction of travel
    public void move() {
        //change the x and y coordinates by myDirectionX and myDirectionY
        myCenterX += myVelCompX;
        myCenterY += myVelCompY;

    }

    //Draws the floater at the current position
    public void show() {
        fill(myColor);
        stroke(myColor);
        strokeWeight(1);

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