import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Periln2D extends PApplet {

// float xOff;
float rOff, bOff, gOff;
float r, g, b;

public void setup(){
  
  background(0);
  // xOff = 0;

  rOff = 0;
  gOff = 0;
  bOff = 0;
}

public void draw(){
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
      ry += 0.01f;
      gy += 0.02f;
      by += 0.03f;
    }
    // tx += 0.01;
    // xOff += 0.001;

    rx += 0.01f;
    rOff += 0.001f;

    gx += 0.01f;
    gOff += 0.001f;

    bx += 0.01f;
    bOff += 0.001f;
  }
}
  public void settings() {  size(300, 300, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Periln2D" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
