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

public class CoordenadasPolares extends PApplet {

float angulo = 0.0f;
float velAng = 0.0f;
float accAng = 0.0001f;
float radio = 200;

public void setup(){
	
	background(0);
}

public void draw(){
	//background(0);
	if(radio > 0){
		pushMatrix();
		translate(width/2, height/2);
		float x = cos(angulo)*radio;
		float y = sin(angulo)*radio;
		//ellipse(x, y, 20, 20);
		//point(x, y);
		stroke(255);
		line(0, 0, x, y);
		angulo += velAng;
		velAng += accAng;
		radio -= 0.1f;
		popMatrix();
	}
}
  public void settings() { 	size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CoordenadasPolares" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
