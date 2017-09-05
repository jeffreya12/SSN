float tam = 15;

void setup(){
  size(800, 600, P3D);
  background(0);
}

void draw(){
  PVector centro = new PVector(noise(frameCount / 100.0) * width, noise(frameCount / 100.0) * height);
  for(int x = 0; x < width; x += tam){
    for(int y = 0; y < width; y += tam){
      PVector dif = PVector.sub(centro, new PVector(x, y));
      float dist = dif.mag();
      float r = map(sin((frameCount + dist) / 7), -1, 1, 0, 255);
      float g = map(sin((frameCount + dist) / 15), -1, 1, 0, 255);
      float b = map(sin((frameCount + dist) / 20), -1, 1, 0, 255);
      noStroke();
      fill(r, g, b);
      ellipse(x, y, tam, tam);
    }

  }
}
