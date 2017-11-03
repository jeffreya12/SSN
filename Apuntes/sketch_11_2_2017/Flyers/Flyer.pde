class Flyer{
  PVector pos;
  PVector vel;
  PVector acc;
  float friction = 0.02;
  FlyerDNA dna;
  int creationFrame;
  boolean atTarget;
  boolean justFlapped;
  
  Flyer(float x, float y, FlyerDNA dna){
    pos = new PVector(x,y);
    vel = new PVector (0,0);
    acc = new PVector(0,0);
    this.dna = dna;
    creationFrame = frameCount;
    atTarget = false;
    justFlapped = false;
    
  }
  
  void applyForce(PVector force){
    acc.add(force);
  }
  
  void update(){
    if(!isDead()){
      applyFriction();
      vel.add(acc);
      pos.add(vel);
      acc.mult(0);
    }
  }
  boolean isDead(){
    return pos.y > height || pos.y < 0 || pos.x > width || atTarget;
    
  }
   
  void applyFriction(){
    PVector frictionForce = vel.copy();
    frictionForce.setMag(-friction);
    applyForce(frictionForce);
    
  }
  
  void display(){
    noStroke();
    if(justFlapped){
      fill(128,255,128);
      justFlapped = false;
    }
    else{
      fill(128);
    }
    ellipse(pos.x,pos.y,20,20);
  }
  
  void flap(){
    for(int frame : dna.flappings){
      //Cantidad de frames que se han dibuajdo en la pantalla
      if(frameCount - creationFrame == frame){
        PVector flapForce = new PVector(0.5,-4);
        applyForce(flapForce);
        justFlapped = true;
      }
    }
  }
  void arrived(){
    atTarget = true;
  }
}