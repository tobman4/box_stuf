Controller c;

void setup() {
  size(600,600);
  frameRate(10);
  c = new Controller();
  c.drops.add(new Drop(width/2,height/2));
}

void draw() {
  background(0);
  c.render();
  c.step();
}
