int x = pmouseX;
int y = pmouseY;

void setup() {
    size(1000, 1000);   
}

void draw() {
    
}

void mouseClicked() {
    mandala(x,y);
}

void mandala(int a, int b) {
    stroke(255, 165, 0);
    noFill();

    ellipse(a, b, 200, 200);
    ellipse(a, b, 187, 187);
    ellipse(a, b, 176, 176);
}