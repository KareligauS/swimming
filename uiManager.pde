class uiManager {
int currentCount;    

    uiManager() {}

boolean IsPointInCircle(Circle circle, Vector2 point) {
    //Get the circle's center position
    Vector2 center = circle.transform.GetGlobalPosition();
    
    //Calculate the circle's radius
    float radius = circle.extent / 2.0; 
    
    //Calculate the squared distance between the center and the point
    float squaredDistance = center.GetSquaredDistance(point);
    
    //Calculate the squared radius
    float squaredRadius = radius * radius;
    
    //Check for collision
    return squaredDistance <= squaredRadius;
  }
}

}
//Count up if you click on a trashbag
counter() {
    if (IsPointInCircle && mousePressed) {
        
    }
}
//show message
//

}