ArrayList<Bola> bolas;

void setup(){
	size(800, 600);
	frameRate(120);
	bolas = new ArrayList();

	for (int i = 0;i < 200; i++){
		bolas.add(new Cuadro(random(width), random(height/2), 0, 0));
	}
}

void draw(){
	background(0);
	PVector gravedad = new PVector(0, 0.1);
	for (Bola b : bolas){
		b.aplicarFuerza(gravedad);
		if (b.pos.y > height / 2){
			PVector arrastre = b.vel.copy();
			arrastre.normalize();
			arrastre.mult(pow(b.vel.mag(), 2));
			arrastre.mult(-0.5);
			b.aplicarFuerza(arrastre);
		}
		if (b.pos.y < height / 2){
			PVector friccion = b.vel.copy();
			friccion.normalize();
			friccion.mult(-0.01);
			b.aplicarFuerza(friccion);
		}
		b.actualizar();
		b.dibujar();
	}
}
