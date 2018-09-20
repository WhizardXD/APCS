void setup() {
    size(500, 300);
    textAlign(CENTER,CENTER);
    noLoop();
}

void draw() {

}


class Coin {
    //three member variables
    boolean heads; 
    int myX, myY;



    //three member functions


    //constructor
    Coin(int x, int y) {
    //java code 
    }

    void flip() {
    //java code
        if (Math.random() < 0.5) {
            heads = true;
        } else {
            heads = false;
        }
    }

    void show() {
    //java code
    }
} 


