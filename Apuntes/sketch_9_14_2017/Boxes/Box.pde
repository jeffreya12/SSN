class Box {
	
	float x, y;
	float w, h;
	Body body;

	Box (float x, float y, float w, float h) {
		
		this.x = x;
		this.y = y;
		this.h = h;	
		this.w = w;		

		// 1. Crear BodyDef
		BodyDef bodyDef = new BodyDef();
		bodyDef.type = BodyType.DYNAMIC;
		bodyDef.position.set(box2d.coordPixelsToWorld(x, y));
		
		// 2. Crear Body a partir de BodyDef
		body = box2d.createBody(bodyDef);

		// 3. Crear Shape
		PolygonShape shape = new PolygonShape();
		float  box2dW = box2d.scalarPixelsToWorld(w/2);
		float  box2dH = box2d.scalarPixelsToWorld(h/2);
		shape.setAsBox(box2dW, box2dH);

		// 4. Crear Fixture
		FixtureDef fixture = new FixtureDef();
		fixture.shape = shape;
		fixture.density = 1;
		fixture.friction = 0.3;
		fixture.restitution = 0.5;
		
		// 5. Ponerlo todo junto
		body.createFixture(fixture);
	}
	void draw(){
		fill(0, 180, 255);
		stroke(255);
		rectMode(CENTER);
		
		Vec2 pos = box2d.getBodyPixelCoord(body);
		float a = body.getAngle();
		pushMatrix();
		translate(pos.x, pos.y);
		rotate(-a);
		rect(0, 0, w, h);
		popMatrix();
	}

}