class KochCurve{
  ArrayList<KochLine> lines;

  KochCurve (float x1, float y1, float x2, float y2){
    lines = new ArrayList();
    lines.add(new KochLine(new PVector(x1, y1), new PVector(x2, y2)));
  }

  void display( ) {
    for (KochLine l : lines){
      l.display();
    }
  }

  void next( ) {
    ArrayList<KochLine> newLines = new ArrayList();
    for (KochLine l : lines){
      PVector a = l.getA();
      PVector b = l.getB();
      PVector c = l.getC();
      PVector d = l.getD();
      PVector e = l.getE();
      newLines.add(new KochLine(a, b));
      newLines.add(new KochLine(b, c));
      newLines.add(new KochLine(c, d));
      newLines.add(new KochLine(d, e));
    }
    lines = newLines;
  }


  void change( ) {
    for (KochLine l : lines){
      l.start.add(PVector.random2D());
      l.end.add(PVector.random2D());
    }
  }
}
