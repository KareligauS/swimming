Vector2 canvasSize = new Vector2(1280, 720);

void settings(){
    size((int)canvasSize.x, (int)canvasSize.y); 
}

void setup() {
    rectMode(CENTER);
    ellipseMode(CENTER);
}
  
void draw() {

}

//if mouse is pressed add points
mousePressed() { 
    uiManager.counter(mouseX, mouseY);
    uiManager.mouseHasBeenPressed = true;
}