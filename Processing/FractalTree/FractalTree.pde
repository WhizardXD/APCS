private double fractionLength = .8;
private int smallestBranch = 10;
private double branchAngle = .2;

public void setup() {
    size(640,480);
    noLoop();
}

public void draw() {
	background(0);
	stroke(0,255,0);
	line(320,480,320,380);
	drawBranches(320,380,100,3*Math.PI/2);  //will add later
}

public void mousePressed() {
    redraw();
}

public void drawBranches(float x, float y, float branchLength, double angle) {
	//your code here
    float angle1, angle2;
    float endX1, endX2, endY1, endY2;

    angle1 = (float)(angle + branchAngle);
    angle2 = (float)(angle - branchAngle);

    branchLength *= fractionLength;

    endX1 = (float)(branchLength * Math.cos(angle1) + x);
    endY1 = (float)(branchLength * Math.sin(angle1) + y);
    endX2 = (float)(branchLength * Math.cos(angle2) + x);
    endY2 = (float)(branchLength * Math.sin(angle2) + y);

    line(x, y, endX1, endY1);
    line(x, y, endX2, endY2);

    if (branchLength > smallestBranch) {
        drawBranches(endX1,endY1,branchLength,angle1 + Math.PI/4 * (int)(Math.random()*3)-1);
        drawBranches(endX2,endY2,branchLength,angle2 + Math.PI/4 * (int)(Math.random()*3)-1);
    }
}
