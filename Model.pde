import java.util.Collections;

/**
 * The Model class is a circle with inscribed vertices to
 * create the desired shape.
 */
class Model {
  ArrayList<Float> angles; // primary angles (aka vertices).
  float radius;
  float rotation;
  
  Model(float r) {
    angles = new ArrayList(4);
    radius = r;
    rotation = 0;
  }
  
  /**
   * Adds an a new primary angle to the model.
   * @param angle the new angle to add.
   */
  void addAngle(float angle) {
    angles.add(angle % TWO_PI);
    Collections.sort(angles);
  }
  
  /**
   * Rotates the primary angles in the model by given
   * radians.
   * @param angle the radians to rotate clock-wise.
   */
  void rotate(float angle) {
    rotation += angle % TWO_PI;
    for (int i = 0; i < angles.size(); ++i) {
      float new_angle = (angles.get(i) + angle) % TWO_PI;
      angles.set(i, new_angle);
    }
    Collections.sort(angles);
  }
  
  /**
   * Returns a vertex that reasembles the model.
   * The 't' value is used for interpolation and get the desired
   * vertex. Where a 't' value of 0.0 is the first vertex of
   * the shape, and a 't' value of 1.0 is the last vertex of 
   * the shape.
   * @param t the interpolation value.
   * @param step the step, in radians, to take around the circle.
   * @returns the vertex of the shape.
   */
  PVector getVertex(float t, float step) {
    int total_vertices = (int)(TWO_PI / step);
    int curr_vertex = (int) map(t, 0, 1, 0, total_vertices) % total_vertices;
    
    float angle = curr_vertex * step;
    
    // Find maximum primary angle that is less than 'angle'.
    int index = angles.size() - 1;
    while(true) {
      if (index < 0 || angles.get(index) < angle) { break; }
      --index;
    }
    
    float angle_a = angles.get(rem(index + 0, angles.size()));
    float angle_b = angles.get(rem(index + 1, angles.size()));
    
    PVector vertex = new PVector(1, 0).mult(radius).rotate(angle);
    PVector vertex_a = new PVector(1, 0).mult(radius).rotate(angle_a);
    PVector vertex_b = new PVector(1, 0).mult(radius).rotate(angle_b);
    
    // Find position of angle in side by doing vector-scalar projection.
    PVector side = PVector.sub(vertex_b, vertex_a);
    PVector side_vertex = PVector.sub(vertex, vertex_a);
    float proj = PVector.dot(side_vertex, side) / side.mag();
    
    // Final position calculation.
    return vertex_a.add(side.normalize().mult(proj));
  }
}