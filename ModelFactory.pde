Model triangle_model(float radius) {
  Model model = new Model(radius);
  for (int i = 0; i < 3; ++i) {
    model.addPoint(polarPoint(radius, i * TWO_PI / 3));
  }
  
  return model;
}

Model square_model(float radius) {
  Model model = new Model(radius);
  for (int i = 0; i < 4; ++i) {
    model.addPoint(polarPoint(radius, i * TWO_PI / 4));
  }
  
  return model;
}

Model rectangle_model(float radius) {
  Model model = new Model(radius);
  model.addPoint(polarPoint(radius, TWO_PI / 16));
  model.addPoint(polarPoint(radius, PI - TWO_PI / 16));
  model.addPoint(polarPoint(radius, PI + TWO_PI / 16));
  model.addPoint(polarPoint(radius, TWO_PI - TWO_PI / 16));
  
  return model;
}

Model pentagon_model(float radius) {
  Model model = new Model(radius);
  for (int i = 0; i < 5; ++i) {
    model.addPoint(polarPoint(radius, i * TWO_PI / 5));
  }
  
  return model;
}

Model hexagon_model(float radius) {
  Model model = new Model(radius);
  for (int i = 0; i < 6; ++i) {
    model.addPoint(polarPoint(radius, i * TWO_PI / 6));
  }
  
  return model;
}

Model star_model(float radius) {
  Model model = new Model(radius);
  for (int i = 0; i < 5; ++i) {
    model.addPoint(polarPoint(radius, i * TWO_PI / 5));
    model.addPoint(polarPoint(radius / 2, i * TWO_PI / 5 + TWO_PI / 10)); 
  }
  return model;
}

Model cardioid_model(float radius) {
  int VERTICES = 32;
  Model model = new Model(radius);
  for (float t = 0; t < TWO_PI; t += TWO_PI / VERTICES) {
    float r = radius / 2 * (1 - cos(t));
    model.addPoint(polarPoint(r, t));
  }
  return model;
}

Model blobbie_model(float radius) {
  int VERTICES = 32;
  Model model = new Model(radius);
  for (float t = 0; t < TWO_PI; t += TWO_PI / VERTICES) {
    float r = radius * 4 / 7 * (1 + 0.25*cos(2*t + 5) + 0.5*cos(3*t));
    model.addPoint(polarPoint(r, t));
  }
  return model;
}