class Brian extends Automaton {
  Brian(float w) {
    super(w);
  }
  Cell createCell(float x, float y, float w) {
    return new BrianCell(x, y, w, (int)random(3));
  }
  void next() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < columns; c++) {
        int n = neighbors(r, c);
        Cell cell = cells[r][c];
        if (cell.state == 0 && n == 2) cell.newState = 2;
        else if (cell.state == 2) cell.newState = 1;
        else if (cell.state == 1) cell.newState = 0;
        else cell.newState = cell.state;
      }
    }
  }
  int neighbors(int row, int col) {
    int result = 0;
    for (int r = row - 1; r < row + 2; r++) {
      for (int c = col -1; c < col + 2; c++) {
        if (r >= 0 && r < rows && c >= 0 && c < columns) {
          if ((r != row || c != col) && cells[r][c].state == 2) {
            result += 1;
          }
        }
      }
    }
    return result;
  }
  void click() {
    int c = (int)(mouseX / w);
    int r = (int)(mouseY / w);
    if (r < rows && c < columns) {
      cells[r][c].newState = 2;
    }
  }
}