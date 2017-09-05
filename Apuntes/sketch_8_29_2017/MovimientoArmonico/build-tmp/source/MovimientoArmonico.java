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

public class MovimientoArmonico extends PApplet {

float x;
float y;
float t, t2;

public void setup() {
	
	background(0);
	y = height / 2;
	t = 0;
	t2 = 0;	
}

public void draw() {
	background(0);
	x = map(sin(t), -1, 1, 0, width);
	y = map(sin(t2), -1, 1, 0, height);
	ellipse(x, y, 39, 41);
	t += 0.1f;
	t2 += 0.01f;
}
  public void settings() { 	size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "MovimientoArmonico" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
