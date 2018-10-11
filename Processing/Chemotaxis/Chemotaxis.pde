// int bacColor = color
int a, b;
Bacteria [] colony;

void setup() {
    size(500, 500);

    colony = new Bacteria[100];

    for (int i = 0; i < colony.length; i++) {
        colony[i] = new Bacteria();
    }
}

void draw() {
    fadingBackground();
    for (int i = 0; i < colony.length; i++) {
        colony[i].move();
        colony[i].show();
    }

}

void fadingBackground() {
    fill(0, 0, 0, 10);
    strokeWeight(0);

    rect(0, 0, 500, 500);
    loop();
}


class Bacteria {

    int myX, myY;
    int a = ((int)((Math.random()*8)-4));
    int b = ((int)((Math.random()*8)-4));


    Bacteria() {
        // a = ((int)((Math.random()*8)-4));
        myX = myY = 250;
        //  + (-50 * a);
    }

    void move() {
        if (mouseX > myX) {
            a = ((int)((Math.random()*8)-1));
        } else if (mouseY > myY) {
            b = ((int)((Math.random()*8)-1));
        } else if (mouseX < myX) {
            a = ((int)((Math.random()*8)-7));
        } else if (mouseY < myY) {
            b = ((int)((Math.random()*8)-7));
        } else {
            a = ((int)((Math.random()*8)-4));
            b = ((int)((Math.random()*8)-4));
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