class PolarPoint implements Comparable<PolarPoint> {
  private float radius;
  private float angle;
  
  PolarPoint(float radius, float angle) {
    this.radius = radius;
    this.angle = angle % TWO_PI;
  }
  
  float getRadius() {
    return this.radius;
  }
  
  void setRadius(float radius) {
    this.radius = radius;
  }

  float getAngle() {
    return angle;
  }
  
  void setAngle(float angle) {
    this.angle = angle % TWO_PI;
  }
  
  void rotate(float angle) {
    this.angle += angle;
    this.angle %= TWO_PI;
  }
  
  int compareTo(PolarPoint other) {
    if (angle < other.angle) { return -1; }
    else if (angle > other.angle) { return 1; }
    else { return 0; }
  }
}