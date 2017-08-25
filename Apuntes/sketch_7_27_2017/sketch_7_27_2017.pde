color c, cf;
PImage img; 

void setup() {
  //size(800, 600); //Tamaño del canvas
  fullScreen(); //Canvas en fullscreen
  c = color (random(255), random(255), random(255)); //Tipo color
  cf = color (random(255), random(255), random(255)); //Tipo color
  img = loadImage("morty.png");
  background(cf);
  blendMode(DIFFERENCE);
}

void draw() {
  //ellipse(100, 100, 50, 20); //Elipse en el punto X, Y
  //ellipse(width / 2, height / 2, 50, 50); //Elipse en el centro del canvas
  //ellipse(mouseX, mouseY, 50, 50); //Elipse en el mouse
  //fill(255, 0, 0); //Relleno de las figuras RGB + Transparencia
  //stroke (255); //Lineas de las figuras
  //fill(random(255), random(255), random(255), random(100)); //Funcion de random
  //background(random(255), random(255), random(255)); //Fondo del canvas
  
  fill(c);
  //rectMode(CENTER);
  //rect(mouseX, mouseY, 50, 50); //Rectangulo
  //if(mousePressed){ //variable mousePressed
  //  c = color (random(255), random(255), random(255));
  //}
  
  imageMode(CENTER);
  image(img, mouseX, mouseY); //Cargar imagen
  
}

//void mousePressed(){ //Funcion de pulsar el mouse
//  c = color (random(255), random(255), random(255));
//}

//void keyPressed(){ //Funcion de pulsar el mouse
//  if(key == CODED){ //Tecla especial, variable key
//    cf = color (random(255), random(255), random(255));
//  }
//}