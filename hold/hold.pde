Ball[] balls;

boolean DBG = false;
int index = 0;

void setup() {
  size(600,600,P2D);
  //fullScreen(P2D);
  balls = new Ball[3];
  for(int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);
  
  int updates = 0;
  loadPixels();
  for(Ball curr : balls) {
    noFill();
    stroke(0,255,0);
    int x = round(curr.pos.x-curr.range/2)-1;
    int y = round(curr.pos.y-curr.range/2)-1;
    int w = curr.range+2;
    for(int i = x; i < x+w; i++) {
      for(int j = y; j < y+w; j++) {
        int index = (width*j)+i;
        if(index < 0 || index > pixels.length-1) {
          continue;
        } else {
          updates++;
          int R1 = round(map(dist(i,j,balls[0].pos.x,balls[0].pos.y),0,balls[0].range/2,255,0));
          //int R2 = round(map(dist(i,j,balls[3].pos.x,balls[3].pos.y),0,balls[3].range/2,255,0));
          int R2 = 0;
          int R = max(R1,R2);
          
          int G1 = round(map(dist(i,j,balls[1].pos.x,balls[1].pos.y),0,balls[1].range/2,255,0));
          //int G2 = round(map(dist(i,j,balls[4].pos.x,balls[4].pos.y),0,balls[4].range/2,255,0));
          int G2 = 0;
          int G = max(G1,G2);
          
          int B1 = round(map(dist(i,j,balls[2].pos.x,balls[2].pos.y),0,balls[2].range/2,255,0));
          //int B2 = round(map(dist(i,j,balls[5].pos.x,balls[5].pos.y),0,balls[5].range/2,255,0));
          int B2 = 0;
          int B = max(B1,B2);
          pixels[index] = color(R,G,B);  
        }
      }
    }
    
  }
  updatePixels();
  for(Ball curr : balls) {
    curr.step();
    curr.render();
  }
  println(updates + "/" + pixels.length);
}

void mousePressed() {
  balls[index].mouse_mode = false;
   index++;
   if(index >= balls.length) {
     index = 0;
   }
   balls[index].mouse_mode = true;
}
