
Fluid [] particles;

void setup() {
    size(500, 500);

    particles = new Fluid[1000];

    for (int i = 0; i < particles.length; i++) {
        particles[i] = new Fluid();
    }

    fill(255, 255, 255);
    rect(500, 500, 500, 10);
}

void draw() {
    for (int i = 0; i < particles.length; i++) {
        particles[i].show();
    }
}


class Fluid {
    
    int myX, myY;
    double xpos, ypos, speed, angle, gravity;
    double a, b, c;

    Fluid() {
        myX = myY = 250;
        a = Math.random();
    }

    void move() {

    }

    void show() {
        fill(255, 54, 67);
        rect(myX, myY, 2, 2);
    }



}