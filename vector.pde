class Triangle {
  Transform transform = new Transform();
  Vector2 point1 = new Vector2();
  Vector2 point2 = new Vector2();
  Vector2 point3 = new Vector2();
  color fillColor;
  
  Triangle() { }
  
  Triangle(Triangle another) {
    fillColor = another.fillColor;
    SetVertices(another.point1, another.point2, another.point3);
    transform = new Transform(another.transform);
  }
  
  Triangle(color fill, Vector2 p1, Vector2 p2, Vector2 p3){
    SetVertices(p1, p2, p3);
    fillColor = fill;
    transform = new Transform(GetCentralPoint(this), 0);
  }

  void SetVertices(Vector2 p1, Vector2 p2, Vector2 p3){
    point1.SetCoordinates(p1);
    point2.SetCoordinates(p2);
    point3.SetCoordinates(p3);
  }

  Triangle Build(){
    Triangle temp = new Triangle(this);

    return temp.WithRotation().WithPosition();
  }

  void display() {
    Triangle tempTriangle = Build();

    fill(fillColor);
    triangle(tempTriangle.point1.x, tempTriangle.point1.y, tempTriangle.point2.x, tempTriangle.point2.y, tempTriangle.point3.x, tempTriangle.point3.y);
  }

  Triangle WithPosition(){
    Triangle temp = new Triangle(this);
    Vector2 distanceFromCentre = GetOffsetFromPoint(transform.GetGlobalPosition(), GetCentralPoint(temp));

    return temp.WithOffset(distanceFromCentre);
  }

  Triangle WithRotation(){
    Triangle temp = new Triangle(this);
    
    temp.point1.RotateAndSet(transform.GetGlobalRotation());
    temp.point2.RotateAndSet(transform.GetGlobalRotation());
    temp.point3.RotateAndSet(transform.GetGlobalRotation());
    
    return temp;
  }
  
  float minX(Triangle triangle) {
    return min(triangle.point1.x, triangle.point2.x, triangle.point3.x);
  }

  float maxX(Triangle triangle) {
    return max(triangle.point1.x, triangle.point2.x, triangle.point3.x);
  }

  float minY(Triangle triangle) {
    return min(triangle.point1.y, triangle.point2.y, triangle.point3.y);
  }

  float maxY(Triangle triangle) {
    return max(triangle.point1.y, triangle.point2.y, triangle.point3.y);
  }

  Vector2 GetCentralPoint(Triangle tempTriangle){
    return new Vector2(
      (tempTriangle.point1.x + tempTriangle.point2.x + tempTriangle.point3.x) / 3, 
      (tempTriangle.point1.y + tempTriangle.point2.y + tempTriangle.point3.y) / 3
    );
  }
  
  Triangle WithOffset(Vector2 offset){
    Triangle temp = new Triangle(this);

    temp.point1.SumAndSet(offset);
    temp.point2.SumAndSet(offset);
    temp.point3.SumAndSet(offset);
    
    return temp;
  }
  
  Vector2 GetOffsetFromPoint(Vector2 initialPoint, Vector2 endPoint){
    return initialPoint.Substitute(endPoint);
  }
}

class Circle {
  Transform transform = new Transform();
  float extent;
  color fillColor;

  public Circle() {}

  public Circle(color _fillColor, float _extent, Vector2 initialPosition) {
    fillColor = _fillColor;
    extent = _extent;
    transform.SetPosition(initialPosition);
  }

  public void display(){
    stroke(1,1,1);
    fill(fillColor);
    Vector2 position = transform.GetGlobalPosition();
    circle(position.x, position.y, extent);
    noStroke();
  }
}

class Vector2 {
  float x;
  float y;
  
  Vector2(){}
  
  Vector2(float _x, float _y) {
    SetCoordinates(_x, _y);
  }
  
  Vector2(Vector2 another) {
    SetCoordinates(another);
  }
  
  Vector2 Rotate(float rotation){
    // cos  | - sin | x
    // sin  |   cos | y
    
    float rad = radians(rotation); 
    Vector2 temp = new Vector2();
    temp.x = cos(rad) * x + -sin(rad) * y;
    temp.y = sin(rad) * x + cos(rad) * y;
    
    return temp;
  }
  
  Vector2 Sum(Vector2 another) {
    return new Vector2(this.x + another.x, this.y + another.y);
  }
  
  Vector2 Substitute(Vector2 another){
    return new Vector2(this.x - another.x, this.y - another.y);
  }
  
  Vector2 DivideBy(float number){
    return new Vector2(this.x / number, this.y / number);
  }

  Vector2 MultiplyBy(float number){
    return new Vector2(this.x * number, this.y * number);
  }
  
  void RotateAndSet(float rotation){
    SetCoordinates(Rotate(rotation));
  }
  
  void SumAndSet(Vector2 another) {
    SetCoordinates(Sum(another));
  }
  
  void SubstituteAndSet(Vector2 another) {
    SetCoordinates(Substitute(another));
  }
  
  void DivideAndSetBy(float number) {
    SetCoordinates(DivideBy(number)); 
  }

  void MultiplyAndSetBy(float number) {
    SetCoordinates(MultiplyBy(number));
  }
  
  void SetCoordinates(Vector2 another){
    this.x = another.x;
    this.y = another.y;
  }
  
  void SetCoordinates(float _x, float _y) {
    x = _x;
    y = _y;
  }
}
