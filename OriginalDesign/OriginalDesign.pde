int x = mouseX;
int y = mouseY;

void setup() {
    size(1000, 1000);   
}

void draw() {
    fill(0, 0, 0, 10);
    rect(0, 0, 1000, 1000);
}

void mouseDragged() {
    mandala(x,y);
}

void mouseClicked() {
    mandala(x,y);
}

void mandala(int a, int b) {
    stroke(255, 165, 0);
    noFill();

    ellipse(mouseX, mouseY, 200, 200);
    ellipse(mouseX, mouseY, 187, 187);
    ellipse(mouseX, mouseY, 176, 176);
}