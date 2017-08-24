ArrayList<Bola> bolas;

void setup(){
	size(800, 600);
	frameRate(120);
	bolas = new ArrayList();

	for (int i = 0;i < 200; i++){
		bolas.add(new Bola(random(width), random(height), 0, 0));
	}
}

void draw(){
	background(0);
	PVector gravedad = new PVector(0, 0.1);
	for (Bola b : bolas){
		b.aplicarFuerza(gravedad);
		if (mousePressed){
			PVector viento = new PVector(mouseX, mouseY);
			viento.sub(b.pos);
			viento.setMag(-1);
			b.aplicarFuerza(viento);
		}
		PVector arrastre = b.vel.copy();
		arrastre.normalize();
		arrastre.mult(pow(b.vel.mag(), 2));
		arrastre.mult(-0.5);
		b.aplicarFuerza(arrastre);
		b.actualizar();
		b.dibujar();
	}
}