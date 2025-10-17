color backgroundColor = #9DE8F0;
Vector2 canvasSize = new Vector2(1280, 720);
GameSystem system = new GameSystem();
float globalGravity = 1;
int station = 0;
Squirrel squ1 = new Squirrel(950, 230);
Pool pool = new Pool();

Tree[] trees = new Tree[4];

void settings(){
    size((int)canvasSize.x, (int)canvasSize.y);
}

void setup() {
    rectMode(CENTER);
    ellipseMode(CENTER);

    trees[0]= new Tree(1250, 500, #0A712D, #40A261);//green
    trees[1]= new Tree(1250, 500, #FFAA64, #E34C15);//red
    trees[2]= new Tree(1250, 500, #FFFFFF, #E8F4F5);//white
    trees[3]= new Tree(1250, 500, #F7D1FC, #FC8CE1);//pink
}
  
void draw() {
    background(backgroundColor);
    system.display();
}

void mouseClicked() {
    system.onClick(mouseX, mouseY);
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == UP) {
        station=0;
        } else if (keyCode == DOWN) {
        station=1;
        } else if (keyCode == RIGHT) {
        station =2;
        } else if (keyCode == LEFT) {
        station=3;
        }
    }
}

void mousePressed() {
    if (mouseButton == RIGHT ) {
      squ1.move(10);
    } else if (mouseButton == LEFT ) {
      squ1.move(-10);
    }
  }