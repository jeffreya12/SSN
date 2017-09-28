class Particle {
  Body body;
  float r;

  Particle(float x, float y, float r) {
    this.r = r;
    makeBody(x, y);
  }

  void makeBody(float x, float y) {
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    CircleShape cs = new CircleShape();
    cs.setRadius(box2d.scalarPixelsToWorld(r));


    FixtureDef fd = new FixtureDef();
    fd.setShape(cs);
    fd.setDensity(1);
    fd.setFriction(10);
    fd.setRestitution(0.01);

    body.createFixture(fd);

    body.setLinearVelocity( new Vec2(random(-10, 10), random(0, 10) ) );
    body.setAngularVelocity(random(-10, 10));
  }


  void killBody() {
    box2d.destroyBody(body);
  }

  boolean done() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if(pos.y > height * 2) {
      killBody();
     return true;
    }
    return false;
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(#FF0062);
    stroke(255);
    strokeWeight(2);
    ellipse(0, 0, r * 2, r * 2);
    line(-r, 0, r, 0);
    line(0, -r, 0, r);
    popMatrix();
  }
}
