class SquareParticle extends Particle{

	float ang;
	float velAng;
	float accAng;

	SquareParticle (float x, float y, float mass, float friction){
		super(x, y, mass, friction);
		ang = 0;
		velAng = 0.01;
		accAng = 0;
	}

	void draw(){
		noStroke();
		fill(c, lifeSpan);
		rectMode(CENTER);
		pushMatrix();
		translate(pos.x, pos.y);
		rotate(ang);
		rect(0, 0, mass*5, mass*5);
		popMatrix();
	}

	void update(){
		super.update();
		ang += velAng;
		velAng += accAng;
		accAng = 0;
	}

}
