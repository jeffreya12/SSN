class OppositeSquareParticle extends SquareParticle{

	OppositeSquareParticle (float x, float y, float mass, float friction){
		super(x, y, mass, friction);
	}

	void applyForce(PVector force){
		PVector f = PVector.div(force, mass);
		f.mult(-1);
		acc.add(f);
	}

}
