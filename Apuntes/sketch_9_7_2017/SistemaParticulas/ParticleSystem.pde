import java.util.Iterator;

class ParticleSystem {
  PVector origin;
  ArrayList<Particle> particles;

  ParticleSystem(float x, float y){
    origin = new PVector(x, y);
    particles = new ArrayList();
  }

  void update() {
    Iterator<Particle> i = particles.iterator();
    while(i.hasNext()){
      Particle p = i.next();
      p.update();
      if(p.isDead()){
        i.remove();
      }
    }
  }

  void draw(){
    for(Particle p : particles){
      p.draw();
    }
  }

  void applyForce(PVector force){
    for(Particle p : particles){
      p.applyForce(force);
    }
  }

  void addParticle(){
    Particle p = new Particle(origin.x, origin.y, randomGaussian()*2 + 5, 0.1);
    PVector dir = PVector.random2D();
    dir.setMag(random(2, 5));
    p.applyForce(dir);
    particles.add(p);
  }

}
