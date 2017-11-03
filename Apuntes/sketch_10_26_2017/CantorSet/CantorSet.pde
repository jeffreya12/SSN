float despX, despY = 0;

void setup( ) {
  //size(800, 600, P3D);
  fullScreen(P2D);
  background(0);
  stroke(255);
  strokeWeight(10);
}

void draw(){
  background(0);
  cantor(0, height / 2, width);
}

void cantor(float x, float y, float w){
  if(w < 1) return;
  line(x, y, x + w, y);
  cantor(x, y + 20, w / 3);
  cantor(x + w / 3 * 2, y + 20, w / 3);
}
