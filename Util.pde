/**
 * Remainder function that wraps around
 * on negative values.
 * @param a the first member of the operation.
 * @param b the second member of the operation.
 * @returns the remainder of a over b.
 */
int rem(int a, int b) {
  return (a % b + b) % b;
}

/**
 * Creates a new Polar point from the components.
 * @param radius the radius.
 * @param angle the angle.
 * @returns a new polar point.
 */
PolarPoint polarPoint(float radius, float angle) {
  return new PolarPoint(radius, angle);
}

/**
 * Creates a PVector from polar components.
 * @param radius the radius(length) of the vector.
 * @param angle the angle(in radians) of the vector.
 */
PVector fromPolar(float radius, float angle) {
  return new PVector(1, 0).mult(radius).rotate(angle);
}