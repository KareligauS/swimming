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
  }
}
