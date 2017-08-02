float[] vals;

void setup( ) {
  size(400, 300);
  //fullScreen();
  background(0);
  stroke(255);
  vals = new float[width];
  frameRate(100000000000L);
}

void draw(){
  int n = int (monteCarlo() * width);
  vals[n] += 1;
  for(int x = 0; x < width; x++){
    line(x, height, x, height - vals[x]);
  }
}

float monteCarlo(){
  while(true){
    float r1 = random(1);
    //Distribución lineal
    //float probabilidad = r1 ; //Lineal
    //float probabilidad = r1 * r1; //Exponencial
    float probabilidad = log(r1 * 2.7182 + 1); //Logaritmica
    //float probabilidad = 0.1 / r1; //Hiperbolica
    float r2 =  random(1);

    if(r2 < probabilidad){
      return r1;
    }
  }
}
