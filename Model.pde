import java.util.Collections;

/**
 * The Model class is a circle with inscribed vertices to
 * create the desired shape.
 */
class Model {
  ArrayList<PolarPoint> points;
  float radius;
  float angle;
  
  Model(float r) {
    points = new ArrayList();
    radius = r;
    angle = 0;
  }
  
  /**
   * Adds an a new point to the model.
   * @param point the new point to add.
   */
  void addPoint(PolarPoint point) {
    points.add(point);
    Collections.sort(points);
  }
  
  /**
   * Rotates the points in the model by given
   * radians.
   * @param angle the radians to rotate clock-wise.
   */
  void rotate(float angle) {
    this.angle += angle % TWO_PI;
    for (PolarPoint p : points) {
      p.rotate(angle);
    }
    Collections.sort(points);
  }
  
  /**
   * Returns a vertex that reasembles the model.
   * The 't' value is used for interpolation and get the desired
   * vertex. Where a 't' value of 0.0 is the first vertex of
   * the shape, and a 't' value of 1.0 is the last vertex of 
   * the shape.
   * @param t the interpolation value.
   * @returns the vertex of the shape.
   */
  PVector getVertex(float t) {
    float angle = t * TWO_PI % TWO_PI;
    
    // Find index whose angle is strictly less than 'angle'.
    int index = points.size() - 1;
    while(index >= 0 && points.get(index).getAngle() >= angle) {
      --index;
    }
    
    // Start and end points of the current side of the shape.
    PolarPoint point_a = points.get(rem(index + 0, points.size()));
    PolarPoint point_b = points.get(rem(index + 1, points.size()));
    
    // Get and denormalize angles. We need to be strictly:
    // angle_a <= angle <= angle_b.
    float angle_a = point_a.getAngle();
    float angle_b = point_b.getAngle();
    if (angle_a > angle_b) angle_b += TWO_PI;
    if (angle_a > angle) angle += TWO_PI;
    
    // Now that points are normalized, we can convert them to vectors.
    PVector vertex_a = fromPolar(point_a.getRadius(), angle_a);
    PVector vertex_b = fromPolar(point_b.getRadius(), angle_b);
    
    // 'side' vector from vertex_a to vertex_b. The position of a vertex on
    // this side depends on the position of `angle` between `angle_a` and
    // `angle_b`. Values are interpolated using `map`.
    PVector side = PVector.sub(vertex_b, vertex_a);
    float scale = map(angle, angle_a, angle_b, 0, 1);
    
    return vertex_a.add(side.mult(scale));
  }
}