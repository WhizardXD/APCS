public void setup() {
    size(500,500);
    rectMode(CENTER);
    noLoop();
}

public void draw() {
    sierpinski(250,250,300);
    line(0, 250, 500, 250);
    line(250,0,250,500);
}

public void mouseDragged() {
    redraw();
}

public void sierpinski(float x, float y, float len) {
    if (len == 10) {
        equilateralTriangle(x, y, len);
    } else {
        len -= 20;
        sierpinski(x,y,len);
    }

    
}

public void equilateralTriangle(float x, float y, float side) {
    float height  = side * (float)Math.sqrt(3)/2;
    triangle(x,y-(2*height/3),x+side/2,y+height/3,x-side/2,y+height/3);
}