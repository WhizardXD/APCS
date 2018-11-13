Particle [] balls;
void setup() {
	size(500, 500);
	frameRate(60);
	
	balls = new Particle[500];
	for (int i = 0; i < balls.length; i++) {
		balls[i] = new NormalParticle();
	}
}

void draw() {
	fadingBackground();
	for (int i = 0; i < balls.length; ++i) {
		balls[i].show();
		balls[i].move();
	}
}

void fadingBackground() {
    fill(0, 0, 0, 10);
    strokeWeight(0);

    rect(0, 0, 500, 500);
    loop();
}


class NormalParticle implements Particle {

	double myX, myY;
	double mySpeed, myAngle;
	double a, b;
	int myColor;

	NormalParticle() {
		a = ((Math.random()*15));
		b = ((Math.random()*361));
		myX = ((int)(Math.random()*251)+125);
		myY = ((int)(Math.random()*501));
		myColor = color(((int)(Math.random()*256)), ((int)(Math.random()*256)), ((int)(Math.random()*256)));
		mySpeed = a;
		myAngle = b;
	}

	void move() {
		myX = myX + ((Math.cos(myAngle)) * mySpeed);
		myY = myY + ((Math.sin(myAngle)) * mySpeed);
	}

	void show() {
		fill(myColor);
		ellipse((float)myX, (float)myY, 10, 10);
	}
}

interface Particle {
	public void show();
	public void move();
}

// class OddballParticle implements Particle {
//     //uses an interface
// 	//your code here
// }

// class JumboParticle extends NormalParticle {
//     //uses inheritance
// 	//your code here
// }

