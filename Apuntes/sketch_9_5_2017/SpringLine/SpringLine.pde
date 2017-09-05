ArrayList<IAgent> agents;
Particle p1;
Particle p2;
Spring s;

void setup() {
	size(800, 600);
	background(0);
	p1 = new Particle(width / 2 - 100, height / 2, 5, 0.1);
	p2 = new Particle(width / 2 + 100, height / 2, 5, 0.1);
	s = new Spring(p1, p2, 0.1, 150);
	agents = new ArrayList();
	agents.add(p1);
	agents.add(p2);
	agents.add(s);
}

void draw() {
	background(0);
	for(IAgent a : agents){
		a.update();
		a.draw();
	}	
}