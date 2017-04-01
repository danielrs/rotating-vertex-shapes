Model triangle_model(float radius) {
  Model model = new Model(radius);
  model.addAngle(0 * TWO_PI / 3);
  model.addAngle(1 * TWO_PI / 3);
  model.addAngle(2 * TWO_PI / 3);
  
  return model;
}

Model square_model(float radius) {
  Model model = new Model(radius);
  model.addAngle(0 * TWO_PI / 4);
  model.addAngle(1 * TWO_PI / 4);
  model.addAngle(2 * TWO_PI / 4);
  model.addAngle(3 * TWO_PI / 4);
  
  return model;
}

Model rectangle_model(float radius) {
  Model model = new Model(radius);
  model.addAngle(TWO_PI / 16);
  model.addAngle(PI - TWO_PI / 16);
  model.addAngle(PI + TWO_PI / 16);
  model.addAngle(TWO_PI - TWO_PI / 16);
  
  return model;
}

Model pentagon_model(float radius) {
  Model model = new Model(radius);
  model.addAngle(0 * TWO_PI / 5);
  model.addAngle(1 * TWO_PI / 5);
  model.addAngle(2 * TWO_PI / 5);
  model.addAngle(3 * TWO_PI / 5);
  model.addAngle(4 * TWO_PI / 5);
  
  return model;
}

Model hexagon_model(float radius) {
  Model model = new Model(radius);
  model.addAngle(0 * TWO_PI / 6);
  model.addAngle(1 * TWO_PI / 6);
  model.addAngle(2 * TWO_PI / 6);
  model.addAngle(3 * TWO_PI / 6);
  model.addAngle(4 * TWO_PI / 6);
  model.addAngle(5 * TWO_PI / 6);
  
  return model;
}