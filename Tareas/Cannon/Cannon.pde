ArrayList<Bola> bolas;

void setup(){
	size(800, 600);
	bolas = new ArrayList();
	noCursor();
}

void draw(){
	background(0);

	PVector mouse = new PVector (mouseX, mouseY);
  PVector centro = new PVector (width / 2, height / 2);
  PVector diff = PVector.sub(mouse, centro);
	diff.setMag(40);

	if (mousePressed){
		bolas.add(new Cuadro(width/2 + diff.x, height/2 + diff.y, 0, 0));
		bolas.get(bolas.size() - 1).aplicarFuerza(new PVector(diff.x, diff.y));
	}

	PVector gravedad = new PVector(0, 0.5);

	for (Bola b : bolas){
		b.aplicarFuerza(gravedad);
		PVector fuerza = b.vel.copy();
		fuerza.normalize();

		if (b.pos.y > height/2){ //Arrastre del agua
			fuerza.mult(pow(b.vel.mag(), 2));
			fuerza.mult(-0.5);
		}
		else{ //Friccion del aire
			fuerza.mult(-0.01);
		}

		b.aplicarFuerza(fuerza);
		b.actualizar();
		b.dibujar();
	}

	//Cañón
	strokeWeight(1);
	stroke(255);
  fill(255);
  ellipse(mouse.x, mouse.y, 10, 10);
	strokeWeight(30);
	pushMatrix();
  translate(width / 2, height / 2);
	line(0, 0, diff.x, diff.y);
	popMatrix();

	//Agua
	rectMode(CORNER);
	fill(0, 0, 255, 50);
	noStroke();
	rect(0, height/2, width, height/2);
}
