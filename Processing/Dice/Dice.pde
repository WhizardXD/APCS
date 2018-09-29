void setup() {
    size(500, 500);
	noLoop();
}

void draw() {
    background(197);
	int total = 0;
	for (int j = 125; j <= 425; j+=120) {
		for (int i = 125; i <= 425; i+=120) {
			Die bob1 = new Die(j,i);
			bob1.show();
			total = total + bob1.rollNum;
		}
	}
	textSize(15);
	text("Total value: " + total,192,50);
}

void mousePressed() {
	redraw();
}


class Die {//models one single dice cube

	int myX, myY; 
	int rollNum = (int)(Math.random()*6)+1;
	int rotAte = (int)(Math.random()*2)+1;
	
	Die(int x, int y) {
        //constructor
		myX = x;
		myY = y;
	}

	void roll() {
		rollNum = (int)(Math.random()*6)+1;
		rotAte = (int)(Math.random()*2)+1;
	}


	void show() {
		fill(255, 255, 255);
		rect(myX - 24, myY - 24, 48, 48, 10);

		if (rollNum == 1) {
			fill(0, 0, 0);
			ellipse(myX, myY, 6, 6);
		} else if (rollNum == 2) {
			if (rotAte == 1) {
				fill(0, 0, 0);
				ellipse(myX - 10, myY - 10, 6, 6);
				ellipse(myX + 10, myY + 10, 6, 6);
			} else {
				fill(0, 0, 0);
				ellipse(myX - 10, myY + 10, 6, 6);
				ellipse(myX + 10, myY - 10, 6, 6);
			}
		} else if (rollNum == 3) {
			if (rotAte == 1) {
				fill(0, 0, 0);
				ellipse(myX, myY, 6, 6);
				ellipse(myX - 12, myY - 12, 6, 6);
				ellipse(myX + 12, myY + 12, 6, 6);		
			} else {
				fill(0, 0, 0);
				ellipse(myX, myY, 6, 6);
				ellipse(myX - 12, myY + 12, 6, 6);
				ellipse(myX + 12, myY - 12, 6, 6);		
			}
		} else if (rollNum == 4) {
			fill(0, 0, 0);
			ellipse(myX - 10, myY - 10, 6, 6);
			ellipse(myX + 10, myY + 10, 6, 6);
			ellipse(myX - 10, myY + 10, 6, 6);
			ellipse(myX + 10, myY - 10, 6, 6);
		} else if (rollNum == 5) {
			fill(0, 0, 0);
			ellipse(myX, myY, 6, 6);
			ellipse(myX - 12, myY - 12, 6, 6);
			ellipse(myX + 12, myY + 12, 6, 6);
			ellipse(myX - 12, myY + 12, 6, 6);
			ellipse(myX + 12, myY - 12, 6, 6);
		} else if (rollNum == 6) {
			if (rotAte == 1) {
				fill(0, 0, 0);
				ellipse(myX - 11, myY - 11, 6, 6);
				ellipse(myX + 11, myY + 11, 6, 6);
				ellipse(myX - 11, myY + 11, 6, 6);
				ellipse(myX + 11, myY - 11, 6, 6);
				ellipse(myX + 11, myY, 6, 6);
				ellipse(myX - 11, myY, 6, 6);
			} else {
				fill(0, 0, 0);
				ellipse(myX - 11, myY - 11, 6, 6);
				ellipse(myX + 11, myY + 11, 6, 6);
				ellipse(myX - 11, myY + 11, 6, 6);
				ellipse(myX + 11, myY - 11, 6, 6);
				ellipse(myX, myY + 11, 6, 6);
				ellipse(myX, myY - 11, 6, 6);

			}
		}
	}
}
