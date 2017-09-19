class StaticBox extends Box{
	
	StaticBox(float x, float y, float w, float h){
		this.x = x;
		this.y = y;
		this.h = h;	
		this.w = w;		

		type = BodyType.STATIC;
		c = color(0, 255, 0);

		createBody();
	}
}