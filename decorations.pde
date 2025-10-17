class Tree {
    int x;
    int y;
    color tree1Col;
    color tree2Col;
  
  
    Tree(int x, int y, color t1col, color t2col) {
      this.x=x;
      this.y =y;
  
      tree1Col=t1col;
      tree2Col=t2col;
    }
  
    void display() {
      noStroke();
      //leaves
      fill(tree1Col);
      ellipse(x-200, y-250, 450, 250);
      ellipse(x-100, y-450, 400, 150);
      fill(tree2Col);
      circle(x, y-200, 300);
      ellipse(x-100, y-300, 400, 200);
      circle(x-50, y-400, 200);
  
      //wood
      fill(#714315);
      rect(x, y, 120, 600);
      rect(x-100, y-200, 500, 50);
      triangle(x, y, x-125, y+300, x, y+300);
  
      //leaves
      fill(tree2Col);
      ellipse(x-200, y-350, 300, 150);
      fill(tree1Col);
      circle(x+50, y-290, 240);
  
      //House
      fill(#FFF586);
      square(x-250, y-285, 120);
      fill(#FFAF46);
      triangle(x-340, y-345, x-160, y-345, x-250, y-400);
      fill(#B5EDF2);
      rect(x-220, y-310, 25, 20);
      fill(#B5EDF2);
      rect(x-280, y-305, 30, 35);
      fill(#B45747);
      rect(x-250, y-250, 35, 50);

      //Trash

    }
  }

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

  class Pool {
    // state explanation: scale 0-5. 0 = clean, 5 = poluted
    int state;
  
    Pool () {
    }
  
    void display(int istate) {
  
      // The white stroke of the pool
      strokeWeight(20);
      stroke(#FFFFFF);
      line(195, 390, 805, 390);
      line(805, 390, 915, 710);
      line(915, 710, 85, 710);
      line(85, 710, 195, 390);
      strokeWeight(1);
  
      // The blue tiles
      fill(#05C5F2);
      beginShape();
      vertex(200, 400);
      vertex(800, 400);
      vertex(900, 700);
      vertex(100, 700);
      vertex(200, 400);
      endShape();
      // The surface under the water
      fill(#EAEAEA);
      beginShape();
      vertex(200, 430);
      vertex(800, 430);
      vertex(890, 700);
      vertex(110, 700);
      vertex(200, 430);
      endShape();
  
      // For loops to create the tile pattern in the swimming pool
      for (int i=0; i<31; i++) {
        line(200+20*i, 400, 200+20*i, 550);
        line(150+23.3*i, 700, 200+20*i, 550);
      }
      for (int i=0; i<6; i++) {
        line(200, 400+30*i, 100+10*i, 700);
        line(800, 400+30*i, 900-10*i, 700);
        line(200, 400+30*i, 800, 400+30*i);
        line(200-10*i, 550+30*i, 800+10*i, 550+30*i);
        line(200-10*i, 400+30*i, 200-10*i, 550+30*i);
        line(800+10*i, 400+30*i, 800+10*i, 550+30*i);
        line(150-10*i, 550+30*i, 150-10*i, 700);
        line(850+10*i, 550+30*i, 850+10*i, 700);
      }
  
      // Part of the staircase that is beneath water level.
      strokeWeight(5);
      stroke(#A8B2B4);
      line(142, 645, 142, 690);
      line(125, 710, 142, 660);
      line(125, 730, 142, 680);
      line(125, 685, 125, 700);
      line(125, 690, 142, 640);
  
      // Lowe stroke of the swimming pool again to hide the staircase.
      strokeWeight(20);
      stroke(#FFFFFF);
      line(915, 710, 85, 710);
  
      // If statement that makes sure the color level of the water changes according to the number of thrashbacks thrown in.
      state = istate;
      if (state == 0) {
        fill(#54F1F5, 50);
      } else if (state == 1) {
        fill(#3CF0D6, 70);
      } else if (state == 2) {
        fill(#2BCB92, 90);
      } else if (state == 3) {
        fill(#29AA27, 99);
      } else {
        fill(#8B6A0D, 99);
      }
  
      // The water
      noStroke();
      beginShape();
      vertex(200, 430);
      vertex(800, 430);
      vertex(890, 700);
      vertex(110, 700);
      vertex(200, 430);
      endShape();
  
      // Displays the part of the staircase above water level.
      stroke(0);
      noFill();
      strokeWeight(5);
      arc(100, 675, 50, 50, PI, TWO_PI);
      arc(117, 625, 50, 50, PI, TWO_PI);
      line(125, 675, 125, 680);
      line(142, 625, 142, 635);
      line(125, 670, 142, 620);
    }
  }

  class Chair {
    Chair() {
    }
  
    void display() {
  
      // legs of the chair
      stroke(#90760C);
      fill(#90760C);
      strokeWeight(8);
      line(300, 350, 300, 250);
      line(380, 350, 380, 250);
      line(310, 330, 310, 230);
      line(370, 330, 370, 230);
  
      // seating
      beginShape();
      vertex(310, 230);
      vertex(370, 230);
      vertex(380, 250);
      vertex(300, 250);
      vertex(310, 230);
      endShape();
  
      // backrest
      rect(340, 190, 60, 50);
  
      // floating live saving rubber band.
      strokeWeight(15);
      noFill();
      stroke(#FFFFFF);
      arc(300, 300, 50, 50, 0, HALF_PI);
      arc(300, 300, 50, 50, PI, PI+HALF_PI);
      stroke(#FF0000);
      arc(300, 300, 50, 50, HALF_PI, PI);
      arc(300, 300, 50, 50, PI+HALF_PI, TWO_PI);
    }
  }