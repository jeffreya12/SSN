class Mouse extends Bola{
  Mouse(){
    super(mouseX, mouseY, 0, 0);
    super.masa = 51;
    super.r = 255;
    super.g = super.b = 0;
  }

  void actualizar(Bola b){
    float G = 0.1;
    PVector fg = PVector.sub(super.pos, b.pos);
    float d = fg.magSq();
    d = constrain(d, 1, 200);
    fg.normalize();
    fg.mult(G * super.masa * b.masa);
    fg.div(d);
    b.aplicarFuerza(fg);
    super.pos.x = mouseX;
    super.pos.y = mouseY;
  }
}
