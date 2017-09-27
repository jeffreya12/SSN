class Carro {
  Particle p1;
  Particle p2;
  Box base;
  Joint joint1;
  Joint joint2;
  float w = 10;
  float h = 50;

  Carro(float x, float y) {

    base = new Box(x, y - h/2, w, h);
    p1 = new Particle(mouseX, mouseY - h, random(10, 20));
    p2 = new Particle(mouseX, mouseY, random(10, 20));

    RevoluteJointDef rjd = new RevoluteJointDef();
    rjd.initialize(base.body, p1.body, p1.body.getTransform().p);
    rjd.motorSpeed = PI * random(1, 5);
    rjd.maxMotorTorque = random(50000000);
    rjd.enableMotor = true;

    RevoluteJointDef rjd2 = new RevoluteJointDef();
    rjd2.initialize(base.body, p2.body, p2.body.getTransform().p);
    rjd2.motorSpeed = PI * random(1, 5);
    rjd2.maxMotorTorque = random(50000000);
    rjd2.enableMotor = true;

    joint1 = box2d.world.createJoint(rjd);
    joint2 = box2d.world.createJoint(rjd2);
  }

  void display() {
    base.display();
    p1.display();
    p2.display();
  }

  boolean done(){
    if (p1.done() || p2.done()){
      return true;
    }
    else{
      return false;
    }
  }

}
