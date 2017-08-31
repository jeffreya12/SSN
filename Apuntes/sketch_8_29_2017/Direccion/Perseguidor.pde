class Perseguidor{
	PVector pos;
	PVector vel;
	PVector acc;
	float masa;

	Perseguidor(float x, float y){
		pos = new PVector(x, y);
		vel = new PVector(0,0);
		acc = new PVector(0,0);
		masa = random(2, 5);
	}

	void actualizar(){
		PVector dir = PVector.sub(new PVector(mouseX, mouseY), pos);
		dir.setMag(0.5);
		pos.add(vel);
		dir.div(masa);
		vel.add(dir);
		vel.limit(5);
	}

	void dibujar(){
		strokeWeight(3);
		stroke(255);
		fill(128);
		pushMatrix();
		translate(pos.x, pos.y);
		float ang = atan(vel.y / vel.x);
		rotate(ang);
		rectMode(CENTER);
		rect(0, 0, masa*10, masa*5);
		popMatrix();
	}
}