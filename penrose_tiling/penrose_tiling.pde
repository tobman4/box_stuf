Tile t;
void setup() {
  size(600,600);
  t = new Kite(300,300);
}

void draw() {
  background(0);
  t.render();
}
