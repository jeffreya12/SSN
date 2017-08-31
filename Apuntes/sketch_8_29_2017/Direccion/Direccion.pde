ArrayList<Perseguidor> perseguidores;

void setup() {
	//size(800, 600);
	fullScreen();
	background(0);
	//p = new Perseguidor(random(width), random(height));	
	perseguidores = new ArrayList();	
	for(int i = 0; i < 500; i++){
		perseguidores.add(new Perseguidor(random(width), random(height)));
	}
}

void draw() {
	background(0);
	for(Perseguidor p : perseguidores){
		p.actualizar();
		p.dibujar();
	}
}