void setup() {
    size(500, 500);   
}

void draw() {
    fadingBackground();

    if (mousePressed == true) {
        mandala();
    }
}



void fadingBackground() {
    fill(0, 0, 0, 10);
    strokeWeight(0);

    rect(0, 0, 500, 500);

}


void mouseDragged() {
    slinky();
}

void mouseClicked() {
    mandala();
}


void mandala() {
    stroke(255, 165, 0);
    noFill();
    strokeWeight(1);

    ellipse(mouseX, mouseY, 220, 220);
    ellipse(mouseX, mouseY, 187, 187);
    ellipse(mouseX, mouseY, 176, 176);
}

void slinky() {
    stroke(140, 165, 255);
    noFill();
    strokeWeight(5);

    ellipse(mouseX, mouseY, 200, 200);
    ellipse(mouseX, mouseY, 177, 177);
    ellipse(mouseX, mouseY, 166, 166);
    
    point(mouseX, mouseY);
}