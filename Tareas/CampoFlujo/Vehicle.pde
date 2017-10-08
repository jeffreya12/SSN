class Vehicle {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass;
  float maxSpeed;
  float maxForce;
  float arrivalRadius;

  float r;
  color c;
  boolean wrapBorders;

  Vehicle(float x, float y, PVector vel) {
    pos = new PVector(x, y);
    this.vel = vel;
    acc = new PVector(0, 0);
    mass = random(1.5, 2.5);
    r = mass * 5;
    maxSpeed = random(3, 5);
    maxForce = random(0.04, 0.1);
    c = color(random(255), random(255), random(255), 200);
    arrivalRadius = 200;
    wrapBorders = true;
  }
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
    borders();
  }
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acc.add(f);
  }
  void seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    desired.setMag(maxSpeed);
    PVector steering = PVector.sub(desired, vel);
    steering.limit(maxForce);
    applyForce(steering);
  }
  void arrive(PVector target) {
    PVector desired = PVector.sub(target, pos);
    float amount = map(desired.mag(), 0, arrivalRadius, 0, maxSpeed);
    desired.setMag(maxSpeed * amount);
    PVector steering = PVector.sub(desired, vel);
    steering.limit(maxForce);
    applyForce(steering);
  }
  void display() {
    float ang = vel.heading();
    noStroke();
    fill(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(ang);
    beginShape();
    vertex(r * 3, 0);
    vertex(0, -r);
    vertex(0, r);
    endShape(CLOSE);
    popMatrix();
  }
  void setWrapBorders(boolean wrap) {
    wrapBorders = wrap;
  }
  void borders() {
    if (wrapBorders) {
      pos.x = (pos.x + width) % width;
      pos.y = (pos.y + height) % height;
    }
  }
}
