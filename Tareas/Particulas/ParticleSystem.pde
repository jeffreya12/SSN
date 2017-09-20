import java.util.Iterator;

class ParticleSystem {
  PVector origin;
  ArrayList<IAgent> agents;
  float k;
  float friction;
  float restLength;

  ParticleSystem(float x, float y, float k, float friction, float restLength){
    origin = new PVector(x, y);
    agents = new ArrayList();
    this.k = k;
    this.friction = friction;
    this.restLength = restLength;
  }

  void update() {
    Iterator<IAgent> i = agents.iterator();
    while(i.hasNext()){
      IAgent a = i.next();
      a.update();
      if(a instanceof Particle){
        Particle p = (Particle) a;
        if(p.isDead()){
          i.remove();
        }
      }
    }
  }

  void draw(){
    for(IAgent p : agents){
      p.draw();
    }
  }

  void applyForce(PVector force){
    for(IAgent a : agents){
      if(a instanceof Particle){
        Particle p = (Particle) a;
        p.applyForce(force);
      }
    }
  }

  void addParticle(){
    Particle p1 = new Particle(origin.x, origin.y, random(1, 10), friction);
    Particle p2 = new Particle(origin.x, origin.y, random(1, 10), friction);
    p1.applyForce(randomDir());
    p2.applyForce(randomDir());
    agents.add(p1);
    agents.add(p2);
    Spring s = new Spring(p1, p2, k, restLength);
    agents.add(s);
  }

  PVector randomDir(){
    PVector dir = PVector.random2D();
    dir.setMag(random(2, 5));
    return dir;
  }

}
