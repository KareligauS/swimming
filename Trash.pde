class Trash {
  float trashX;
  float trashY;
  Trash(float tx, float ty) {
    trashX=tx;
    trashY=ty;
  }
  void display() {
    stroke(0);
    fill(#82BF00);
    ellipse(trashX, trashY-25, 40, 15);

    fill(#716E6E);
    rect(trashX, trashY, 30, 50);

    rect(trashX-10, trashY, 5, 40);
    rect(trashX, trashY, 5, 40);
    rect(trashX+10, trashY, 5, 40);

    rect(trashX, trashY-35, 40, 10);
    rect(trashX, trashY-40, 10, 5);
  }
}
