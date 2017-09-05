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

public class Ejercicio_1 extends PApplet {

public void setup() {
  
  background(0);
}

public void draw() {

  noStroke();

  float r = randomGaussian() * 10 + 120;
  float g = randomGaussian() * 10 + 30;
  float b = randomGaussian() * 10 + 200;

  float x = randomGaussian()*40 + mouseX;
  float y = randomGaussian()*40 + mouseY;

  float circleSize = randomGaussian()*10 + 20;

  fill(b, r, g);

  if(mousePressed){
    ellipse(x, y, circleSize, circleSize);
  }

}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ejercicio_1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
