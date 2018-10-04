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
    for (int i = 0; i < colony.length; i++) {
        colony[i].move();
        colony[i].show();
    }

}


class Bacteria {

    int myX, myY;
    int a = ((int)((Math.random()*8)-4));
    int b = ((int)((Math.random()*8)-4));


    Bacteria() {
        a = ((int)((Math.random()*8)-4));
        myX = myY = 250 + (-50 * a);
    }

    void move() {
        a = ((int)((Math.random()*8)-4));
        b = ((int)((Math.random()*8)-4));

        myX = myX + a;
        myY = myY + b;  
    }

    void show() {
        strokeWeight(0);
        ellipse(myX, myY, 10, 10);
    }

}