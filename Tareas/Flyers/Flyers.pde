import controlP5.*;

float g = 1;
PVector gravity;
Flock flock;
int cantidadObstaculos = 10;
ArrayList<PVector> obstaculos;
int tamanoObstaculos = 20;

ControlP5 cp5;

int MIN_FLAPPINGS = 1;
int MAX_FLAPPINGS = 100;
int MAX_FRAME_VALUE = 600;
float MUTATION_RATE = 0.001;
int FLOCK_SIZE = 1000;

void setup(){
  fullScreen(P2D);
  background(0);
  gravity = new PVector(0,g);
  PVector origin = new PVector (30,height /2);
  PVector target = new PVector(width * 0.75,height/2);
  flock = new Flock(origin, target, gravity, FLOCK_SIZE);
  obstaculos = new ArrayList();

  for (int i = 0; i < cantidadObstaculos; i++){
    obstaculos.add(new PVector(random(tamanoObstaculos, width - tamanoObstaculos), random(tamanoObstaculos, height - tamanoObstaculos)));
  }

  initControls();

}

void draw(){
  background(0);
  drawObstaculos();
  checkObstaculos();
  flock.run();
  if(flock.allDead()){
    flock.next();
  }
}

void mousePressed(){
  if(mouseButton == RIGHT){
    flock.target = new PVector(mouseX, mouseY);
  }
}

void drawObstaculos(){
  noStroke();
  fill(255, 0, 0, 100);
  for(PVector o : obstaculos){
      ellipse(o.x, o.y, tamanoObstaculos, tamanoObstaculos);
  }
}

void checkObstaculos() {
  for (Flyer f : flock.population){
    for (PVector o : obstaculos){
      if(PVector.dist(f.pos, o) <= 10){
        f.dead = true;
      }
    }
  }
}

void initControls(){
	cp5 = new ControlP5(this);
	cp5.addSlider("setMutationRate")
		.setPosition(10, 10)
		.setSize(300, 20)
		.setRange(0, 1)
		.setValue(0.001)
		.setCaptionLabel("Mutation rate");

	cp5.addSlider("setFlockSize")
		.setPosition(10, 40)
		.setSize(300, 20)
		.setRange(1, 1000)
		.setValue(1000)
		.setCaptionLabel("Flock size");
}

void setMutationRate(float value){
	MUTATION_RATE = value;
}

void setFlockSize(int value){
	FLOCK_SIZE = value;
}
