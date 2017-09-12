ArrayList<ParticleSystem> systems;
PVector gravity;
float g = 0.3;

void setup(){
  size(800, 600, P3D);
  background(0);
  //s = new ParticleSystem(width/2, 100);
  systems = new ArrayList();
  gravity = new PVector(0, -g);
}

void draw(){
  background(0);
  for (ParticleSystem s : systems){
    s.applyForce(gravity);
    s.update();
    s.draw();
    s.addParticle();
  }
}

void mousePressed( ) {
  systems.add(new ParticleSystem(mouseX, mouseY));
}
