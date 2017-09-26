import java.util.Iterator;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Box2DProcessing box2d;

ArrayList<Box> boxes;
MouseSpring spring;

void setup() {
  size(800, 600);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  boxes = new ArrayList();
  spring = new MouseSpring();
}

void draw() {
  background(0);
  box2d.step();
  if (mousePressed) {
    boxes.add(new Box(mouseX, mouseY, random(10, 20), random(10, 20)));
  }
  spring.update();
  Iterator<Box> it = boxes.iterator();
  while (it.hasNext()) {
    Box b = it.next();
    if (b.y > width) {
      b.killBody();
      it.remove();
    }
  }
  for (Box b : boxes) {
    b.attractToCenter();
    b.display();
  }
}

void mousePressed() {
  for (Box b : boxes) {
    if (b.mouseOver()) {
      spring.bind(b);
    }
  }
}

void mouseReleased() {
  spring.unbind();
}
