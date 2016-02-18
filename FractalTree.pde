private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .3;  
private double posAngle = 0;
private float orgW = 10;
public void setup() 
{   
	size(640,480);    
	//noLoop(); 
} 
public void draw() 
{   
	posAngle = mouseY;
	if(posAngle <= 0)
		branchAngle = 0.001;
	else
		branchAngle = posAngle/480;
	System.out.println(branchAngle);
	background(200);   
	stroke(170,130,80);
	strokeWeight(orgW);  
	line(320,480,320,380);
	drawBranches(320,380,100,3*Math.PI/2, orgW);   
} 
public void drawBranches(int x,int y, double branchLength, double angle, float sTW) 
{   
	//your code here   
	double angle1, angle2;
	angle1 = angle + branchAngle;
	angle2 = angle - branchAngle;
	branchLength = branchLength*fractionLength;
	sTW = sTW*0.8;
	strokeWeight(sTW);;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if(branchLength>smallestBranch){
		drawBranches(endX1,endY1,branchLength,angle1, sTW);
		drawBranches(endX2,endY2,branchLength,angle2, sTW);
	}else{
		fill(60,235,120);
	}
} 
