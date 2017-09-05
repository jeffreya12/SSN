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

public class Circulos extends PApplet {

float tam = 15;

public void setup(){
  
  background(0);
}

public void draw(){
  PVector centro = new PVector(noise(frameCount / 100.0f) * width, noise(frameCount / 100.0f) * height);
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
  public void settings() {  size(800, 600, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Circulos" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
