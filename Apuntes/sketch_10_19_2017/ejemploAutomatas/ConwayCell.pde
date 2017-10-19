class ConwayCell extends Cell {
  ConwayCell(float x, float y, float w, int state) {
    super(x, y, w, state);
  }
  color getColor() {
    return state == 0? color(0, 0, 0) : color(255, 255, 128);
  }
}