public void setup() {
    size(500, 500);
    rectMode(CENTER);
    frameRate(5);
    // loop();
    rect(250, 250, 600, 600);
    // fractal(250, 250, 0);

}

public void draw() {
    fadingBackground();
    background(0, 0, 0);
    fractal(250, 250, 0, 120);
}

public void fractal(float x, float y, float len, int col) {
    if (len >= 500) {
        fill(0, 0, 0, 0);
        stroke(255, 0, 0);
        strokeWeight(10);
        rect(x, y, len, len);
        // setup();
        // draw();
        // fractal(x, y, len+1);
    } else {
        stroke(col, 0, 0);
        strokeWeight(10);
        rect(x, y, len, len);
        fractal(x, y, len+50, col+(int)(Math.random()*15));
    }
}

public void fadingBackground() {
    fill(0, 0, 0, 10);
    strokeWeight(0);

    rect(0, 0, 500, 500);
    loop();
}