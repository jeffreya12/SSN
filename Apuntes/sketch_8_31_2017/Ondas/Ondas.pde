float amplitud = 100;
float periodo = 200;

void setup(){
  size(800, 600, P3D);
  background(0);
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(5);
  translate(0, height/2);
  beginShape();
  for(int x = 0; x < width; x++){
    float a = (frameCount + x) / periodo * TWO_PI;
    //float a = x;
    float y = amplitud * sin(a);
    //noStroke();
    y += noise(a) * 100 - 50;
    noFill();
    //ellipse(x, y, 30, 30);
    vertex(x, y);
  }
  endShape();
}
