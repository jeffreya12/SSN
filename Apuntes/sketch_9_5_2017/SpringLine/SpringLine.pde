import controlP5.*;

ArrayList<IAgent> agents;
//Particle p1;
//Particle p2;
//Spring s;
float margin = 20;
float n = 30;
float mass = 2;
float friction = 0.1;
float k = 0.2;
float restLength = 10;
float g = 1;
PVector gravity;

ControlP5 cp5;

void setup() {
	size(800, 600);
	//fullScreen(P2D);
	background(0);
	//p1 = new Particle(width / 2 - 100, height / 2, 5, 0.1);
	//p2 = new Particle(width / 2 + 100, height / 2, 5, 0.1);
	//s = new Spring(p1, p2, 0.1, 150);
	agents = new ArrayList();
	//agents.add(p1);
	//agents.add(p2);
	//agents.add(s);
	float sep = (width - 2 * margin) / (n - 1);
	Particle old = null;
	for(int i = 0; i < n; i++){

		Particle p = new Particle(i * sep + margin, 200, mass, friction);

		agents.add(p);

		if(i == 0 || i == n - 1){
			p.fix();
		}

		if (i > 0){
			Spring s = new Spring(p, old, k, restLength);
			agents.add(s);
		}
		old = p;
	}
	gravity = new PVector(0, g);
	initControls();
}

void draw() {
	background(0);
	for(IAgent a : agents){
		if(a instanceof Particle){
			Particle p = (Particle) a;
			p.applyForce(gravity);
		}
		a.update();
		a.draw();
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
}

void setRestLen(float value){
	for(IAgent a : agents){
		if(a instanceof Spring){
			Spring s = (Spring) a;
			s.restLength = value;
		}
	}
}
