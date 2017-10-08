FlowField field;
ArrayList<Vehicle> vehicles;

void setup() {
  size(800, 600, P2D);
  //fullScreen(P2D);
  background(0);
  field = new FlowField(25, 0.5, 0.1);
  vehicles = new ArrayList();
  blendMode(ADD);
}

void draw() {
  background(0);
  field.update();
  field.display();
  fill(255, 0, 0);
  stroke(255, 0, 0);
  ellipse(mouseX, mouseY, 20, 20);
  for (Vehicle v : vehicles) {
    PVector f = field.getForce(v.pos.x, v.pos.y);
    v.applyForce(f);
    v.seek(new PVector(mouseX, mouseY));
    v.update();
    v.display();
  }
  if (mousePressed) {
    vehicles.add(new Vehicle(mouseX, mouseY, PVector.random2D()));
  }
}

void keyPressed(){
  if (keyCode == 's' || keyCode == 'S') {
    if(field.strokeColor == 0){
      field.strokeColor = 128;
    }
    else{
      field.strokeColor = 0;
    }
  }
}
