class Squirrel{
  float squX;
  float squY;
  Squirrel(float sX,float sY){
    this.squX=sX;
    this.squY=sY;
  }
  
  void move(int x){
    pushMatrix();
    translate(0,0);
        squX+=x;
    if(squX>1170){
      squX=1170;
     
    }
    else if (squX<915){
      squX=915;
    }
    popMatrix();
  }
  
  void display(){
pushMatrix();
translate(0,0);
    noStroke();
  
  fill(#795A41);
  ellipse(squX+25,squY-10,40,25);
  ellipse(squX+15,squY+10,30,50);
  
  fill(#896649);
  ellipse(squX,squY, 50,80);
  circle(squX,squY-45,45);
  ellipse(squX+12,squY-40, 10,80);
  ellipse(squX-12,squY-40, 10,80);
  
  fill(#64472F);
  circle(squX-10,squY+35,20);
  circle(squX+10,squY+35,20);
  
  ellipse(squX+15,squY-10,10,20);
  ellipse(squX-15,squY-10,10,20);
  fill(0);
  
  circle(squX+10,squY-45,4);
  circle(squX-10,squY-45,4);
  
  stroke(0);
  line(squX+5,squY-47,squX+15, squY-50);
  line(squX-5,squY-47,squX-15, squY-50);
  popMatrix();
}
  
}
