// float xOff;
float rOff, bOff, gOff;
float r, g, b;

void setup(){
  size(300, 300, P2D);
  background(0);
  // xOff = 0;

  rOff = 0;
  gOff = 0;
  bOff = 0;
}

void draw(){
  background(0);
  //float tx = 0;
  //float tx = xOff;

  float rx = rOff;
  float gx = gOff;
  float bx = bOff;

  for(int x = 0; x < width; x++){
    //float ty = 0;

    float ry = 0;
    float gy = 0;
    float by = 0;

    for (int y = 0; y < height; y++){
      //stroke(random(255));
      // stroke(map(noise(tx, ty), 0, 1, 0, 255));

      // r = map(noise(tx, ty), 0, 1, 0, 255);
      // g = map(noise(tx, ty), 0, 1, 0, 255);
      // b = map(noise(tx, ty), 0, 1, 0, 255);

      r = map(noise(rx, ry), 0, 1, 0, 255);
      g = map(noise(gx, gy), 0, 1, 0, 255);
      b = map(noise(bx, by), 0, 1, 0, 255);

      stroke(r, g, b);
      point(x, y);

      // ty += 0.01;
      ry += 0.01;
      gy += 0.02;
      by += 0.03;
    }
    // tx += 0.01;
    // xOff += 0.001;

    rx += 0.01;
    rOff += 0.001;

    gx += 0.01;
    gOff += 0.001;

    bx += 0.01;
    bOff += 0.001;
  }
}
