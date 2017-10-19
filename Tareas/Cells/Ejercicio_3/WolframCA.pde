class WolframCA {
  int columns;
  int ruleset;
  boolean[] cells;
  int y;
  color c;

  WolframCA(int columns, int ruleset) {
    this.columns = columns;
    this.ruleset = ruleset;
    cells = new boolean[columns];
    initCells();
    y = 0;
    c = color ((int)random(255), (int)random(255), (int)random(255));
  }
  void initCells() {
    for (int i = 0; i < columns; i++) cells[i] = false;
    cells[columns / 2] = true;
  }
  void next() {
    boolean[] generation = new boolean[columns];
    for (int i = 0; i < columns; i++) {
      generation[i] = f(i);
    }
    cells = generation;
    if (y >= height) {
      background(255);
      y = 0;
      initCells();
      ruleset++;
      c = color ((int)random(255), (int)random(255), (int)random(255));
    }
  }
  boolean f(int i) {
    boolean right = cells[(i + 1) % columns];
    boolean center = cells[i];
    boolean left = cells[(i + columns - 1) % columns];
    int value = left? 4 : 0;
    value += center? 2 : 0;
    value += right? 1 : 0;
    return (ruleset & (int)pow(2, value)) != 0;
  }
  void display() {
    float cellWidth = width / (float)columns;
    for (int i = 0; i < columns; i++) {
      float x = (float)i * cellWidth;
      fill(cells[i]? 0 : c);
      noStroke();
      star(x, y, cellWidth, cellWidth, 3);
    }
    y += cellWidth;
    fill(255, 0, 0);
    textSize(30);
    text(ruleset, 15, 30);
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
