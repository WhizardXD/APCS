// int bacColor = color
int a, b;
int locX, locY;
int counter, time;
boolean set;
Bacteria [] colony;

void setup() {
    size(500, 500);
    frameRate(30);
    time = millis();
    colony = new Bacteria[100];

    for (int i = 0; i < colony.length; i++) {
        colony[i] = new Bacteria();
    }
}

void draw() {
    fadingBackground();
    // System.out.println(set);
    // counter = 0;
    // counter++;
    if (((millis() - time)/1000)%20 == 0) {
        set = false;
    }

    for (int i = 0; i < colony.length; i++) {
        colony[i].show();
        colony[i].move();
    }
}

void fadingBackground() {
    fill(0, 0, 0, 10);
    strokeWeight(0);

    rect(0, 0, 500, 500);
    loop();
}

void mouseClicked() {
    locX = mouseX;
    locY = mouseY;
    fill(57, 255, 20);
    rect(locX, locY, 10, 10);

    set = true;
    // time = millis();
}

// void mouseReleased() {
//     set = false;
// }


class Bacteria {

    int myX, myY;
    int a, b;


    Bacteria() {
        // a = ((int)((Math.random()*8)-4));
        myX = myY = 250;
        //  + (-50 * a);
    }

    void move() {
        if (set == true) {
            if (locX > myX && locY > myY) {
                a = ((int)(Math.random()*9)-3);
                b = ((int)(Math.random()*9)-3);
            } else if (locX > myX && locY < myY) {
                a = ((int)(Math.random()*9)-3);
                b = ((int)(Math.random()*9)-5);
            } else if (locX < myX && locY > myY) {
                a = ((int)(Math.random()*9)-5);
                b = ((int)(Math.random()*9)-3);   
            } else if (locX < myX && locY < myY && locX != 0 && locY != 0) {
                a = ((int)(Math.random()*9)-5);
                b = ((int)(Math.random()*9)-5);
            } else if (locX > myX && locY == myY) {
                a = ((int)(Math.random()*9)-3);
                b = ((int)(Math.random()*9)-4);
            } else if (locX < myX && locY == myY) {
                a = ((int)(Math.random()*9)-5);
                b = ((int)(Math.random()*9)-4);
            } else if (locX == myX && locY > myY) {
                a = ((int)(Math.random()*9)-4);
                b = ((int)(Math.random()*9)-3);
            } else if (locX == myX && locY < myY) {
                a = ((int)(Math.random()*9)-4);
                b = ((int)(Math.random()*9)-5);
            } else if (locX == myX && locY == myY) {
                myX = locX;
                myY = locY;
                a = ((int)(Math.random()*9)-4);
                b = ((int)(Math.random()*9)-4);
            }
        } else {
            
        }
        
        if (set == false) { 
            if (mouseX > myX && mouseY > myY) {
                a = ((int)(Math.random()*9)-3);
                b = ((int)(Math.random()*9)-3);
            } else if (mouseX > myX && mouseY < myY) {
                a = ((int)(Math.random()*9)-3);
                b = ((int)(Math.random()*9)-5);
            } else if (mouseX < myX && mouseY > myY) {
                a = ((int)(Math.random()*9)-5);
                b = ((int)(Math.random()*9)-3);
            } else if (mouseX < myX && mouseY < myY && mouseX != 0 && mouseY != 0) {
                a = ((int)(Math.random()*9)-5);
                b = ((int)(Math.random()*9)-5);
            } else if (mouseX > myX && mouseY == myY) {
                a = ((int)(Math.random()*9)-3);
                b = ((int)(Math.random()*9)-4);
            } else if (mouseX < myX && mouseY == myY) {
                a = ((int)(Math.random()*9)-5);
                b = ((int)(Math.random()*9)-4);
            } else if (mouseX == myX && mouseY > myY) {
                a = ((int)(Math.random()*9)-4);
                b = ((int)(Math.random()*9)-3);
            } else if (mouseX == myX && mouseY < myY) {
                a = ((int)(Math.random()*9)-4);
                b = ((int)(Math.random()*9)-5);
            } else if (mouseX == 0 && mouseY == 0) {
                a = ((int)(Math.random()*9)-4);
                b = ((int)(Math.random()*9)-4);
            } else if (locX == myX && locY == myY) {
                myX = locX;
                myY = locY;
                a = ((int)(Math.random()*9)-4);
                b = ((int)(Math.random()*9)-4);
            }
        }

        myX = myX + a;
        myY = myY + b;
    }

    void show() {
        strokeWeight(0);
        fill(255, 255, 255);
        ellipse(myX, myY, 10, 10);
    }

}