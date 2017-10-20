ArrayList<Vehicle> vehicles;
Path p;
boolean settingPoints = true;
boolean pause = false;

void setup() {
  size(800, 600, P2D);
  vehicles = new ArrayList();
  p = new Path();
  background(0);
}

void draw() {
  if (!pause) {
    background(0);
    p.display();
    for (Vehicle v : vehicles) {
      v.flock(vehicles);
      v.follow(p);
      v.update();
      v.borders();
      v.display();
    }
  }
  if (mousePressed) {
    if (settingPoints) {
      p.addPoint(mouseX, mouseY);
    } else {
      float maxSpeed = 3;
      Vehicle v = new Vehicle(mouseX, mouseY, PVector.random2D().mult(maxSpeed), maxSpeed, 0.5);
      vehicles.add(v);
    }
  }
}
void keyPressed() {
  if (key == '\n') {
    settingPoints = false;
  }
  if (key == 'p') {
    pause = !pause;
  }
}
