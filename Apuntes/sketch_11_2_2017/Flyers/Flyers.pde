//Flyer fulano;
float g = 1;
PVector gravity;
Flock flock;

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
  flock = new Flock(origin,target,gravity,FLOCK_SIZE);
}

void draw(){
  background(0);
  flock.run();
  if(flock.allDead()){
    flock.next();
  }

}
