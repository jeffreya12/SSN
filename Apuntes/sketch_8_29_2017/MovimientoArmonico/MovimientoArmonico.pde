float x;
float y;
float t;

void setup() {
	size(800, 600);
	background(0);
	y = height / 2;
	t = 0;	
}

void draw() {
	background(0);
	x = map(sin(t), -1, 1, 0, width);
	ellipse(x, y, 40, 40);
	t += 0.01;
}
