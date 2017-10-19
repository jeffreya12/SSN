class BrianCell extends Cell {
  BrianCell(float x, float y, float w, int state) {
    super(x, y, w, state);
  }
  color getColor() {
    if (state == 0) return color(0, 0, 0);
    else if (state == 1) return color(100, 0, 100);
    else return color(255, 0, 255);
  }
}