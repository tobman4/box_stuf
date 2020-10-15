Block b;

int colors = 5;
color[] color_list;

void setup() {
  size(600,600,P2D);
  
  b = new Block(300,300,new PVector(1,1));
  
  
  color_list = new color[colors];
  for(int i = 0; i < color_list.length; i++) {
    int r = round(random(255));
    int g = round(random(255));
    int b = round(random(255));
    color_list[i] = color(r,g,b);
  }
  b.c = color_list;
}

void draw() {
  background(0);
  b.render();
  b.step(null);
}
