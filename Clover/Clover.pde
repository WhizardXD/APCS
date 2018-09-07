void setup() {
    size(1000,1000);
}

void draw() {
    int x = 0;
    int y = 0;
    while (x <= 1000 && x <= 1000) {
        clover(x,0);
        clover(0,y);
        x = x + 150;
        clover(x,0);
        y = y + 150;
        clover(0,y);

        // fill(255, 9, 46);
        
        
    }

}

void clover(int a, int b) {
    ellipse(a+50, b+50, 50, 50);
    ellipse(a+100, b+50, 50, 50);
    ellipse(a+50, b+100, 50, 50);
    ellipse(a+100, b+100, 50, 50);
}
