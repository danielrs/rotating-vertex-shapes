ArrayList<Model> models;
int curr_index;

int VERTICES;
float INNER_RADIUS;
float OUTER_RADIUS;

boolean key_released = true;

void setup() {
  size(640, 480, P2D);
  
  VERTICES = 48;
  INNER_RADIUS = width / 5;
  OUTER_RADIUS = width / 4;
  
  models = new ArrayList();
  models.add(triangle_model(INNER_RADIUS));
  models.add(square_model(INNER_RADIUS));
  models.add(rectangle_model(INNER_RADIUS));
  models.add(pentagon_model(INNER_RADIUS));
  models.add(hexagon_model(INNER_RADIUS));
  models.add(star_model(INNER_RADIUS));
  curr_index = 0;
}

void keyPressed() {
  if (key_released && key == ' ') {
    key_released = false;
    curr_index++;
  }
}

void keyReleased() {
  if (!key_released && key == ' ') {
    key_released = true;
  }
}

void draw() {
  background(32);

  Model model = models.get(rem(curr_index, models.size()));
  
  translate(width / 2, height / 2);
  for (int i = 0; i < VERTICES; ++i) {
    PVector outer_vert = new PVector(OUTER_RADIUS, 0).rotate(i * TWO_PI / VERTICES);
    PVector inner_vert = model.getVertex(i * 1.0 / VERTICES, TWO_PI / VERTICES);
    
    strokeWeight(2);
    stroke(0, 192, 255);
    line(outer_vert.x, outer_vert.y, inner_vert.x, inner_vert.y);
    
    strokeWeight(6);
    stroke(255, 223, 0);
    point(outer_vert.x, outer_vert.y);
    point(inner_vert.x, inner_vert.y);
  }
  
  model.rotate(0.01);
}