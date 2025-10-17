Settings settings = new Settings();
GameSystem system = new GameSystem();

int station = 0;
Squirrel squ1 = new Squirrel(950, 230);
Pool pool = new Pool();

Tree[] trees = new Tree[4];

void settings(){
    size((int)settings.canvasSize.x, (int)settings.canvasSize.y);
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
    background(settings.backgroundColor);
    system.update(settings);
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