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

public class Montecarlo extends PApplet {

float[] vals;

public void setup( ) {
  
  //fullScreen();
  background(0);
  stroke(255);
  vals = new float[width];
  frameRate(100000000000L);
}

public void draw(){
  int n = PApplet.parseInt (monteCarlo() * width);
  vals[n] += 1;
  for(int x = 0; x < width; x++){
    line(x, height, x, height - vals[x]);
  }
}

public float monteCarlo(){
  while(true){
    float r1 = random(1);
    //Distribuci\u00f3n lineal
    //float probabilidad = r1 ; //Lineal
    //float probabilidad = r1 * r1; //Exponencial
    //float probabilidad = log(r1 * 2.7182 + 1); //Logaritmica
    float probabilidad = 0.1f / r1;
    float r2 =  random(1);

    if(r2 < probabilidad){
      return r1;
    }
  }
}
  public void settings() {  size(200, 150); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Montecarlo" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
