class WolframCA {
  int columns;
  int ruleset;
  boolean[] cells;
  int y;

  WolframCA(int columns, int ruleset) {
    this.columns = columns;
    this.ruleset = ruleset;
    cells = new boolean[columns];
    initCells();
    y = 0;
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
      ruleset = (int)random(0, 255);
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
      fill(cells[i]? 0 : 255);
      noStroke();
      rect(x, y, cellWidth, cellWidth);
    }
    y += cellWidth;
    fill(255, 0, 0);
    textSize(30);
    text(ruleset, 15, 30);
  }
}
