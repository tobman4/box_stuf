int w = 100;
int h = 100;

Game g;
AI ai;

void setup() {
  
  size(750,750);
  
  PVector p = new PVector(0,25);
  PVector s = new PVector(width,height-25);
  g = new Game(p,s,w,h,2000);
  
  p = new PVector(0,0);
  s = new PVector(width,25);
  UI ui = new UI(p,s);
  
  g.set_ui(ui);
  
  ai = new AI(g);
  
}

void draw() {
  background(100);
  g.render();
  g.logic();
  
  ai.step(false);
}

void mousePressed() {
  
  int x = mouseX;
  int y = mouseY;
  g._mousePressed(x,y, mouseButton == RIGHT);
}

void keyPressed() {
  switch(keyCode) {
    case 32:
      ai.is_on = !ai.is_on;
      break;
    case 82:
      g.reset();
      break;
    case 83:
      ai.step(true);
      break;
    default:
      print("Key not in use: ");
      println(keyCode);
      break;
  }
}
