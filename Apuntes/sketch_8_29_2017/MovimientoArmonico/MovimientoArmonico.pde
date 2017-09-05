float x;
float y;
float t, t2;

void setup() {
	size(800, 600);
	background(0);
	y = height / 2;
	t = 0;
	t2 = 0;	
}

void draw() {
	background(0);
	x = map(sin(t), -1, 1, 0, width);
	y = map(sin(t2), -1, 1, 0, height);
	ellipse(x, y, 39, 41);
	t += 0.1;
	t2 += 0.01;
}
