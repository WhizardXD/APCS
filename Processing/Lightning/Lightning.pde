int startX = 250;
int startY = 0;
int endX = 0;
int endY = 250;


void setup() {
    size(500, 500);

    // strokeWeight(100);
    // background(0,0,0);

    frameRate(60);

    noLoop();
}

void draw() {
    fadingBackground();
    while (startY < 500 && startX < 500) {
        int a = 10*((int)((Math.random()*8)-4));
        int b = 10*((int)((Math.random()*8)+1));

        endX = startX + a;
        endY = startY + b;
        stroke(255,255,0);
        strokeWeight(8);
        line(startX, startY, endX, endY);
        startX = endX;
        startY = endY;
        if (startX >= 500 || startX <= 0) {
            startX = 250;
            startY = 0;
            endX = 0;
            endY = 250;
            continue;
        }

        // a = 10*((int)((Math.random()*8)-4));

    }
}

void fadingBackground() {
    fill(0, 0, 0, 10);
    strokeWeight(0);

    rect(0, 0, 500, 500);
    loop();
}


void mousePressed() {
    startY = 0;
    redraw();
}
