class KochLine{
  PVector start;
  PVector end;

  KochLine(PVector start, PVector end){
    this.start = start;
    this.end = end;
  }

  void display( ) {
    stroke(255);
    line(start.x, start.y, end.x, end.y);
  }

  PVector getA(){
    return start.copy();
  }

  PVector getB(){
    PVector b = PVector.sub(end, start);
    b.div(3);
    b.add(start);
    return b;
  }

  PVector getC(){
    PVector c = PVector.sub(end, start);
    c.div(3);
    c.rotate(-PI/3);
    c.add(getB());
    return c;
  }

  PVector getD(){
    PVector d = PVector.sub(end, start);
    d.div(3);
    d.mult(2);
    d.add(start);
    return d;
  }

  PVector getE(){
    return end.copy();
  }
}
