ArrayList<Bola> bolas;
Mouse mouse;
float G;

void setup(){
	size(800, 600, P2D);
	bolas = new ArrayList();
	for(int i = 0; i < 300; i++){
		bolas.add(new Bola(random(50, width - 50), random(50, height - 50), 0, 0));
	}
	mouse = new Mouse();
	G = -0.1;
}

void draw(){
	background(0);
	for (Bola b : bolas){
		for (Bola b2 : bolas) {
			if(b != b2){
				PVector fg = PVector.sub(b2.pos, b.pos);
				float d = fg.magSq();
				fg.normalize();
				fg.mult(G * b.masa * b2.masa);
				fg.div(d);
				b.aplicarFuerza(fg);
			}
		}
		mouse.actualizar(b);
		b.actualizar();
		mouse.dibujar();
		b.dibujar();
	}
}
