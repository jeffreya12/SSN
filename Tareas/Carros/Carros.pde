import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;

Box2DProcessing box2d;
ArrayList<Carro> carros;

Surface surface;

void setup() {
  fullScreen();
  box2dInit();
}

void box2dInit() {
  box2d = new Box2DProcessing(this); ///inicializamos
  box2d.createWorld();
  carros = new ArrayList();
  surface = new Surface();
}

void draw() {
  background(0);

  if(mousePressed){
    float size = random(10, 20);
    carros.add(new Carro(mouseX, mouseY, size));
  }

  box2d.step();
  surface.display();

  for(Carro c : carros) {
    c.display();
  }

  for(int i = carros.size() - 1; i >= 0; i--) {
    Carro c = carros.get(i);
    if(c.done()) {
      carros.remove(i);
    }
  }
}
