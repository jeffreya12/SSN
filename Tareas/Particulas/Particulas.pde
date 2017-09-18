ArrayList<ParticleSystem> systems;
PVector gravity;
float g = 0.2;

ArrayList<Particle> fixedParticles = new ArrayList();

void setup(){
  //size(800, 600, P3D);
  fullScreen(P3D);
  background(0);
  systems = new ArrayList();
  gravity = new PVector(0, g);

  for (int i = 0; i < 20; i++){
    if(random(100) < 50){
      fixedParticles.add(new AttractionParticle(random(width), random(height), random(1, 10), 0.01));
    } else {
      fixedParticles.add(new RepulsionParticle(random(width), random(height), random(1, 10), 0.01));
    }
  }

}

void draw(){
  fill(0, 25);
	rect(0, 0, width, height);

  for (Particle fp : fixedParticles){
    fp.draw();
  }

  for (ParticleSystem s : systems){
    s.applyForce(gravity);
    for(IAgent a : s.agents){
      if(a instanceof Particle){
        for(Particle fp : fixedParticles){
          if(fp instanceof AttractionParticle){
            AttractionParticle ap = (AttractionParticle) fp;
            ap.update((Particle) a);
          } else {
            RepulsionParticle rp = (RepulsionParticle) fp;
            rp.update((Particle) a);
          }
        }
      }
    }
    s.update();
    s.draw();
    if(frameCount % 5 == 0){
      s.addParticle();
    }
  }
}

void mousePressed( ) {
  systems.add(new ParticleSystem(mouseX, mouseY));
}
