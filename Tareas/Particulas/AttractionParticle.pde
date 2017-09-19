class AttractionParticle extends Particle{

	AttractionParticle (float x, float y, float mass, float friction) {
		super(x, y, mass, friction);
		c = color(0, 0, 255);
		fixed = true;
	}

	void update(Particle p){
		float G = 0.1;
    PVector fg = PVector.sub(super.pos, p.pos);
    float d = fg.magSq();
    d = constrain(d, 1, 200);
    fg.normalize();
    fg.mult(G * super.mass * p.mass);
    fg.div(d);
    p.applyForce(fg);
	}

}
