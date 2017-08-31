float angulo = 0.0;
float velAng = 0.0;
float accAng = 0.0001;
float radio = 200;

void setup(){
	size(800, 600);
	background(0);
}

void draw(){
	//background(0);
	if(radio > 0){
		pushMatrix();
		translate(width/2, height/2);
		float x = cos(angulo)*radio;
		float y = sin(angulo)*radio;
		//ellipse(x, y, 20, 20);
		//point(x, y);
		stroke(255);
		line(0, 0, x, y);
		angulo += velAng;
		velAng += accAng;
		radio -= 0.1;
		popMatrix();
	}
}