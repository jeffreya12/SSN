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

public class OperacionesVectores extends PApplet {

public void setup( ) {
    //size(800, 600);
    
    background(0);
    noCursor();
}

public void draw( ) {
  background(0);
  stroke(255);
  fill(255);

  PVector mouse = new PVector (mouseX, mouseY);
  PVector centro = new PVector (width / 2, height / 2);
  ellipse(mouse.x, mouse.y, 10, 10);
  ellipse(centro.x, centro.y, 10, 10);
  PVector diff = PVector.sub(mouse, centro);

  //diff.mult(2);

  diff.setMag(100);

  //translate(width / 2, height / 2);
  line(width / 2, height / 2, diff.x, diff.y);
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "OperacionesVectores" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
