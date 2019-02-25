public void setup() {
    size(500,500);
    rectMode(CENTER);
    noLoop();
}

public void draw() {
    sierpinski(250,290,400);
    // line(0, 250, 500, 250);
    // line(250,0,250,500);
}

public void sierpinski(float x, float y, float len) {
    // equilateralTriangle(x,y,len);
    if (len <= 10) {
        equilateralTriangle(x, y, len);
    } else {
        equilateralTriangle(x,y,len);
        sierpinski(x,y-(len*(float)Math.sqrt(3)/6),len/2);
        sierpinski(x-len/4,y+(len*(float)Math.sqrt(3)/12),len/2);
        sierpinski(x+len/4,y+(len*(float)Math.sqrt(3)/12),len/2);
        // sierpinski(x,y,len/2);
    }

// (len*(float)Math.sqrt(3)/6)

}

public void equilateralTriangle(float x, float y, float side) {
    float height  = side * (float)Math.sqrt(3)/2;
    triangle(x,y-(2*height/3),x+side/2,y+height/3,x-side/2,y+height/3);
}
