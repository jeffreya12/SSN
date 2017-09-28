class Carro {
  Particle p1;
  Particle p2;
  Box base;
  Joint joint1;
  Joint joint2;
  float w = 5;
  float h = 70;
  float torque;
  float speed;

  Carro(float x, float y) {

    base = new Box(x, y - h/2, w, h);
    p1 = new Particle(mouseX, mouseY - h, 20);
    p2 = new Particle(mouseX, mouseY, 20);

    torque = random(50000);
    speed = PI * random(5);

    RevoluteJointDef rjd = new RevoluteJointDef();
    rjd.initialize(base.body, p1.body, p1.body.getTransform().p);
    rjd.motorSpeed = speed;
    rjd.maxMotorTorque = torque;
    rjd.enableMotor = true;

    RevoluteJointDef rjd2 = new RevoluteJointDef();
    rjd2.initialize(base.body, p2.body, p2.body.getTransform().p);
    rjd2.motorSpeed = speed;
    rjd2.maxMotorTorque = torque;
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
