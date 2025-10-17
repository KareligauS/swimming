color backgroundColor = #FFFFFF;
Vector2 canvasSize = new Vector2(1280, 720);
GameSystem system = new GameSystem();
float globalGravity = 1;

void settings(){
    size((int)canvasSize.x, (int)canvasSize.y);
}

void setup() {
    rectMode(CENTER);
    ellipseMode(CENTER);
}
  
void draw() {
    background(backgroundColor);
    system.display();
}

void mouseClicked() {
    system.onClick(mouseX, mouseY);
}