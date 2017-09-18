import shiffman.box2d.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;


ArrayList<Box> boxes;
Box2DProcessing box2d;

void setup() {
	
	size(800, 600, P2D);
	background(0);
	
	boxes = new ArrayList();
	box2d = new Box2DProcessing(this);
	box2d.createWorld();
}

void draw() {
	
	background(0);
	box2d.step();
	
	for(Box b : boxes){
		b.draw();
	}

	if(mousePressed){
		if(mouseButton == LEFT){
			boxes.add(new Box(mouseX, mouseY, 20, 20));
		} else {
			boxes.add(new StaticBox(mouseX, mouseY, 20, 20));
		}
	}
}