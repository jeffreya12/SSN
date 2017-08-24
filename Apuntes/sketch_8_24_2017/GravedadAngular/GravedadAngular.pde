ArrayList<Bola> bolas;

void setup(){
	size(800, 600);

	bolas = new ArrayList();

	for(int i = 0; i < 500; i++){
		bolas.add(new Cuadro(random(width), random(height), 0, 0));
	}
}

void draw(){
	background(0);
	for (Bola b : bolas){
		for (Bola b2 : bolas) {
			if(b != b2){
				float G = 0.001;
				PVector fg = PVector.sub(b2.pos, b.pos);
				float d = fg.magSq();
				d = constrain(d, 8, 311);
				fg.normalize();
				fg.mult(G * b.masa * b2.masa);
				fg.div(d);
				b.aplicarFuerza(fg);
			}
		}
		b.actualizar();
		b.dibujar();
	}
}
