import controlP5.*;

ArrayList<ArrayList<Particle>> particles;
ArrayList<Spring> springs;
//float margin = 20;
//float n = 15;
float mass = 2;
float friction = 0.1;
float k = 0.2;
float restLength = 10;
float g = 0.3;
PVector gravity;
int sep = 50;

ControlP5 cp5;

void setup() {
	//fullScreen(P2D);
	size(800, 800, P3D);
	background(0);
	Particle old = null;
	particles = new ArrayList();
	springs = new ArrayList();

	for (int y = sep; y < height; y += sep){
		particles.add(new ArrayList());
		for (int x = sep; x < width; x += sep){
			Particle p = new Particle(x, y, mass, friction);
			particles.get(particles.size() - 1).add(p);
			int currentPos = particles.get(particles.size() - 1).size() - 1;
			if(x == sep && y == sep || x == ((int)(width/sep) - 1)*sep && y == sep){
				p.fix();
			}
			if (x > sep){
				Spring s = new Spring(p, old, k, restLength);
				springs.add(s);
			}
			if (y > sep){
				Spring s = new Spring(p, particles.get(particles.size() - 2).get(currentPos), k, restLength);
				springs.add(s);
			}
			old = p;
		}
	}

	gravity = new PVector(0, g);
	initControls();
}

void draw() {
	background(0);

	for (ArrayList<Particle> row : particles){
		for(Particle p : row){
			if(keyPressed && (keyCode == LEFT)){
				p.applyForce(new PVector(-1, 0));
			}
			if(keyPressed && (keyCode == RIGHT)){
				p.applyForce(new PVector(1, 0));
			}
			if(keyPressed && (keyCode == UP)){
				p.applyForce(new PVector(0, -1));
			}
			if(keyPressed && (keyCode == DOWN)){
				p.applyForce(new PVector(0, 1));
			}
			p.applyForce(gravity);
			p.update();
			p.draw();
		}
	}

	for(Spring s : springs){
		s.update();
		s.draw();
	}

}

void initControls(){
	cp5 = new ControlP5(this);
	cp5.addSlider("setRestLen")
		.setPosition(10, 10)
		.setSize(300, 20)
		.setRange(1, 100)
		.setValue(restLength)
		.setCaptionLabel("Rest Length");

	cp5.addSlider("setMass")
		.setPosition(10, 40)
		.setSize(300, 20)
		.setRange(1, 100)
		.setValue(mass)
		.setCaptionLabel("Mass");

	cp5.addSlider("setFriction")
		.setPosition(10, 70)
		.setSize(300, 20)
		.setRange(0, 10)
		.setValue(friction)
		.setCaptionLabel("Friction factor");

	cp5.addSlider("setK")
		.setPosition(10, 100)
		.setSize(300, 20)
		.setRange(0, 1)
		.setValue(k)
		.setCaptionLabel("K");

	cp5.addSlider("setG")
		.setPosition(10, 130)
		.setSize(300, 20)
		.setRange(0, 1)
		.setValue(g)
		.setCaptionLabel("G");
}

void setRestLen(float value){
	for(Spring s : springs){
		s.restLength = value;
	}
}

void setFriction(float value){
	for(ArrayList<Particle> row : particles){
		for(Particle p : row){
			p.friction = value;
		}
	}
}

void setMass(float value){
	for(ArrayList<Particle> row : particles){
		for(Particle p : row){
			p.mass = value;
		}
	}
}

void setG(float value){
	gravity.set(0, value);
}

void setK(float value){
	for(Spring s : springs){
		s.restLength = value;
	}
}
