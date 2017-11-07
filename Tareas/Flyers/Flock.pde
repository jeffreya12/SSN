class Flock {
  ArrayList<Flyer> population;
  ArrayList<Flyer> flyers;
  PVector origin;
  PVector target;
  PVector gravity;
  Selection selection;
  int generation;
  int added;

  Flock(PVector origin, PVector target, PVector gravity, int size) {
    this.origin = origin;
    this.target = target;
    this.gravity = gravity;
    selection = new Selection(this);
    population = selection.firstGeneration(size);
    flyers = new ArrayList();
    generation = 1;
    added = 0;
  }

  void applyForce(PVector force) {
    for (Flyer f : flyers) {
      f.applyForce(force);
    }
  }

  void display() {
    for (Flyer f : flyers) {
      f.display();
    }
    noStroke();
    fill(0, 0, 255, 100);
    ellipse(origin.x, origin.y, 50, 50);
    fill(0, 255, 0, 100);
    ellipse(target.x, target.y, 50, 50);
  }

  void update() {
    addFlyer();
    addFlyer();
    addFlyer();
    addFlyer();
    for (Flyer f : flyers) {

      if (!f.isDead()) {
        if (PVector.dist(f.pos, target) <= 25) {
          f.arrived();
        }
        f.update();
      }
    }
  }

  void addFlyer() {
    if (added < population.size()) {
      flyers.add(population.get(added));
      added++;
    }
  }

  void flap() {
    for (Flyer f : flyers) {
      f.flap();
    }
  }

  void run() {
    applyForce(gravity);
    flap();
    update();
    display();
  }

  void next() {
    population = selection.nextGeneration();
    flyers.clear();
    added = 0;
    generation++;
  }

  int getSize() {
    return population.size();
  }

  Flyer getFlyer(int pos) {
    return population.get(pos);
  }

  boolean allDead() {
    for (Flyer f : population) {
      if (!f.isDead()) {
        return false;
      }
    }
    return true;
  }
}
