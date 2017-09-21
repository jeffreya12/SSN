import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;
ArrayList<MultipleShape> polygons;
Surface surface;

void setup() {
  fullScreen();
  box2dInit();
}

void box2dInit() {
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0, -20);
  polygons = new ArrayList();
  surface = new Surface();
}

void draw() {
  background(0);
  box2d.step();

  surface.display();
  for (MultipleShape p : polygons) {
    p.display();
  }
  for (int i = polygons.size() - 1; i >= 0; i--) {
    MultipleShape p = polygons.get(i);
    if (p.done()) {
      polygons.remove(i);
    }
  }
  if (mousePressed) {
    polygons.add(new MultipleShape(mouseX, mouseY));
  }
}
