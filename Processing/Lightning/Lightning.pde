int startX = 250;
int startY = 0;
int endX = 0;
int endY = 250;


void setup() {
    size(500, 500);

    strokeWeight(1);
    background(255,255,0);

    noLoop();
}

void draw() {
    while (startY < 500) {
        int a = 10*((int)((Math.random()*8)-4));
        int b = 10*((int)((Math.random()*8)+1));

        fill(0,0,0);
        line(startX, startY, (startX + a), (startY + b));
        startX = startX + a;
        startY = startY + b;

        // a = 10*((int)((Math.random()*8)-4));

    }
}


void mousePressed() {
    redraw();
}