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

public class Ondas extends PApplet {

float amplitud = 100;
float periodo = 200;

public void setup(){
  
  background(0);
}

public void draw(){
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
  public void settings() {  size(800, 600, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ondas" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
