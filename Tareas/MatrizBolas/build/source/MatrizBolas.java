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

public class MatrizBolas extends PApplet {

float increment = 0.01f;

float zoff = 0.0f;

float zincrement = 0.02f;

float r, g, b;

public void setup() {
  
  noStroke();
  frameRate(30);
}

public void draw() {

  background(0);

  float xoff = 0.0f;

  for (int x = 10; x < width; x += 10) {

    xoff += increment;

    float yoff = 0.0f;

    for (int y = 10; y < height; y += 10) {

      yoff += increment;

      r = randomGaussian()*20 + 244;
      g = randomGaussian()*20 + 66;
      b = randomGaussian()*20 + 101;

      float circleSize = noise(xoff,yoff,zoff)*20;

      float newPosX = map(noise(xoff,yoff,zoff), 0, 1, x - 50, x + 50);
      float newPosY = map(noise(xoff,yoff,zoff), 0, 1, y - 50, y + 50);

      fill(r, g, b);

      ellipse(newPosX, newPosY, circleSize, circleSize);

    }

  }

  zoff += zincrement;

}
  public void settings() {  size(800, 600, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "MatrizBolas" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
