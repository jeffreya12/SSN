Automaton a;

void setup() {
  fullScreen();
  a = new Conway(10);
}
void draw() {
  background(0);
  a.next();
  if (mousePressed) a.click();
  a.display();
}