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
		PVector friccion = b.vel.copy();
		friccion.normalize();
		friccion.mult(-0.01);
		b.aplicarFuerza(friccion);
		b.actualizar();
		b.dibujar();
	}

}
