private double fractionLength = .8;
private double smallestBranch = 10;
private double branchAngle = .2;
public void setup()
{ 
 size(640,480);    
 noLoop();
}
public void draw()
{ 
 background(0); 
 stroke(0,255,0); 
 line(320,480,320,380); 
 drawBranches(320,380, 50, 3*Math.PI/2);  //will add later
}
public void drawBranches(double x,double y, double branchLength, double angle)
{ 
 //your code here    
 double angle1, angle2;
 double endX1, endY1, endX2, endY2;
 angle1 = angle + branchAngle;
 angle2 = angle - branchAngle;
 
 //
endX1 = (double)(branchLength*Math.cos(angle1) + x);
endY1 = (double)(branchLength*Math.sin(angle1) + y);
endX2 = (double)(branchLength*Math.cos(angle2) + x);
endY2 = (double)(branchLength*Math.sin(angle2) + y);
line((float)x, (float)y, (float)endX1, (float)endY1);
line((float)x, (float)y, (float)endX2, (float)endY2);
branchLength = (double)(fractionLength*(double)branchLength);
if(branchLength >= Math.abs(smallestBranch + 1) ){
  drawBranches(endX1, endY1, branchLength, angle1);
  drawBranches(endX2, endY2, branchLength, angle2);
}
}
void keyPressed(){
  if( keyCode == UP){
    smallestBranch += 2;
    //System.out.println(smallestBranch);
  }
  if(keyCode == DOWN){
    smallestBranch -= 2;
     //System.out.println(smallestBranch);
  }
  if( keyCode == LEFT){
    branchAngle += .2;
    //System.out.println(smallestBranch);
  }
  if(keyCode == RIGHT){
    branchAngle -= .2;
    // System.out.println(smallestBranch);
  }
  redraw();
}

