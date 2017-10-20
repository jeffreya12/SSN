Automaton a;

void setup() {
  fullScreen();
  a = new Brian(5);
}
void draw() {
  background(0);
  a.next();
  if (mousePressed) a.click();
  a.display();
}