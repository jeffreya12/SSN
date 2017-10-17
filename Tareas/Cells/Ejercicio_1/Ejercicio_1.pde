WolframCA ca;

void setup() {
  size(800, 600);
  background(255);
  ca = new WolframCA(200, 30);
}

void draw() {
  ca.display();
  ca.next();
}
