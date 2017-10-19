abstract class Cell {
  float x;
  float y;
  float w;
  int state;
  int newState;
  
  Cell(float x, float y, float w, int state) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.state = state;
  }
  void display() {
    state = newState;
    color c = getColor();
    noStroke();
    fill(c);
    rect(x, y, w, w);
  }  
  abstract color getColor();
}