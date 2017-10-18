class Vehicle {
  PVector pos;
  PVector vel;
  PVector acc;
  float mass = 1;
  float r = 5;
  float maxSpeed;
  float maxForce;
  float maxPathDistance = 200;
  float lookAhead = 50;
  float pathLookAhead = 0;
  color c;
  float alignmentDistance;
  float alignmentRatio;
  float separationDistance;
  float separationRatio;
  float cohesionDistance;
  float cohesionRatio;

  Vehicle(float x, float y, PVector vel, float maxSpeed, float maxForce) {
    pos = new PVector(x, y);
    this.vel = vel;
    acc = new PVector(0, 0);
    this.maxSpeed = maxSpeed;
    this.maxForce = maxForce;
    separationDistance = 200;
    separationRatio = 1;
    alignmentDistance = 40;
    alignmentRatio = 1;
    cohesionDistance = 40;
    cohesionRatio = 1;
    c = color(random(100, 255), 58, random(0, 255));
  }
  void update() {
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
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
  void display() {
    float ang = vel.heading();
    stroke(255);
    strokeWeight(1);
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
  void borders() {
    pos.x = (pos.x + width) % width;
    pos.y = (pos.y + height) % height;
  }

  void align(ArrayList<Vehicle> vehicles) {
    PVector average = new PVector(0, 0);
    int count = 0;
    for (Vehicle v : vehicles) {
      float d = PVector.dist(pos, v.pos);
      if (this != v && d < alignmentDistance) {
        average.add(v.vel);
        count++;
      }
    }
    if (count > 0) {
      average.div(count);
      average.setMag(alignmentRatio);
      average.limit(maxForce);
      applyForce(average);
    }
  }
  void separate(ArrayList<Vehicle> vehicles) {
    PVector average = new PVector(0, 0);
    int count = 0;
    for (Vehicle v : vehicles) {
      float d = PVector.dist(pos, v.pos);
      if (this != v && d < separationDistance) {
        PVector difference = PVector.sub(pos, v.pos);
        difference.normalize();
        difference.div(d);
        average.add(difference);
        count++;
      }
    }
    if (count > 0) {
      average.div(count);
      average.setMag(separationRatio);
      average.limit(maxForce);
      applyForce(average);
    }
  }
  void cohere(ArrayList<Vehicle> vehicles) {
    PVector center = new PVector(0, 0);
    int count = 0;
    for (Vehicle v : vehicles) {
      float d = PVector.dist(pos, v.pos);
      if (this != v && d < cohesionDistance) {
        center.add(v.pos);
        count++;
      }
    }
    if (count > 0) {
      center.div(count);
      PVector force = center.sub(pos);
      force.setMag(cohesionRatio);
      force.limit(maxForce);
      applyForce(force);
    }
  }
  void flock(ArrayList<Vehicle> vehicles) {
    separate(vehicles);
    align(vehicles);
    cohere(vehicles);
  }

  void follow(Path path) {
    PVector predicted = getPredictedPos();
    PVector normal = getClosestNormalPoint(path, predicted);
    float distance = PVector.dist(predicted, normal);
    if (distance > path.radius) {
      seek(normal);
    }
  }
  PVector getPredictedPos() {
    PVector predicted = vel.copy();
    predicted.setMag(lookAhead);
    predicted.add(pos);
    return predicted;
  }
  PVector getClosestNormalPoint(Path path, PVector predicted) {
    ArrayList<PVector> normalPoints = getNormalPoints(path, predicted);
    PVector closest = getClosest(normalPoints, predicted);
    return closest;
  }
  ArrayList<PVector> getNormalPoints(Path path, PVector predicted) {
    ArrayList<PVector> normalPoints = new ArrayList();
    for (Segment s : path.getSegments()) {
      PVector start, end;
      if (s.start.x < s.end.x) {
        start = s.start;
        end = s.end;
      } else {
        start = s.end;
        end = s.start;
      }
      PVector a = PVector.sub(predicted,start);
      PVector b = PVector.sub(end, start);
      b.normalize();
      b.mult(a.dot(b) + pathLookAhead);
      b.add(start);
      if ((b.x >= start.x && b.x <= end.x) || (b.x >= end.x && b.x <= start.x)) {
        if ((b.y >= start.y && b.y <= end.y) || (b.y >= end.y && b.y <= start.y)) {
          normalPoints.add(b);
        }
      }
    }
    return normalPoints;
  }
  // si no hay puntos normales válidos, retorna la predicción
  PVector getClosest(ArrayList<PVector> normalPoints, PVector predicted) {
    if (normalPoints.size() == 0) {
      return predicted;
    }
    PVector closest = normalPoints.get(0); // cambiar esto para que utilice un punto muy lejano
    for (int i = 1; i < normalPoints.size(); i++) {
      if (predicted.dist(normalPoints.get(i)) < predicted.dist(closest)) {
        closest = normalPoints.get(i);
      }
    }
    if (predicted.dist(closest) < maxPathDistance) {
      return closest;
    } else {
      return predicted;
    }
  }
}
