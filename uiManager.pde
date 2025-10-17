//place holder setup

setup() {
    canvas(200,200);
    trashbag = new Circle();
}
draw() {

}
*/

// --- Minimal placeholder for the Circle class ---
class Circle {
    float x, y, radius;
    Circle(float x, float y, float r) {
        this.x = x;
        this.y = y;
        this.radius = r;
    }
}

class uiManager {
    int points;
    boolean mouseHasBeenPressed;


    //constructor
    uiManager() {
        points = 0; // Initialize points
    }

    /**
     * Checks if the given point (px, py) is inside the Circle
     */
    boolean IsPointInCircle(Circle circle, float px, float py) {
        // Calculate the squared distance between the point and the circle's center
        // dx = (px - circle.x)
        float dx = px - circle.x;
        // dy = (py - circle.y)
        float dy = py - circle.y;
        
        // Squared distance = dx^2 + dy^2
        float squaredDistance = sq(dx) + sq(dy); 
        
        // Calculate the squared radius
        float squaredRadius = sq(circle.radius); 
        
        // Check for collision: squared distance <= squared radius
        return squaredDistance <= squaredRadius;
    }

    // check for a click on a specific circle
    void counter(Circle trashbag) {
        // Use mouseX and mouseY for the point position
        // Check if the point (mouseX, mouseY) is in the circle and the mouse is pressed
        if (IsPointInCircle(trashbag, mouseX, mouseY)) { 
            points++;
            circle trashbag = null;
            mouseHasBeenPressed false;
        }
    }
 //update gamestate
    void update(Circle trashbag) {
        counter(trashbag);
    }
//update display
    void display() {
        String pointsMsg = "Current Points: " + points;
        fill(200); 
        text(pointsMsg, 40, 40);
    }
}