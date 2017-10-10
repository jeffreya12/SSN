void setup() {
	size(800, 600);
}

void draw() {
	background(0);
	PVector center = new PVector(width/2, height/2);
	PVector mouse = new PVector(mouseX, mouseY);
	PVector v1 = new PVector(200, 0);
	PVector v2 = PVector.sub(mouse, center);

	translate(width/2, height/2);
	stroke(255);
	strokeWeight(3);
	line(0, 0, v1.x, v1.y);
	line(0, 0, v2.x, v2.y);

	//float dot = v1.dot(v2);
	//float ang = acos(dot / (v1.mag() * v2.mag()));

	//float ang = PVector.angleBetween(v1, v2);

	PVector v3 = v1.copy(); 
	v1.normalize();
	float dot = v1.dot(v2);
	v3.setMag(dot);

	PVector d = PVector.sub(v2, v3);
	float dist = d.mag();

	fill(255, 0, 0);
	ellipse(v3.x, v3.y, 10, 10);
	strokeWeight(1);
	line(v2.x, v2.y, v3.x, v3.y);

	fill(255);
	textSize(15);
	
	//text("Radianes: " + ang + "\nGrados: " + degrees(ang), -350, 250);
	
	text("Distancia: " + dist, -350, 250);

}