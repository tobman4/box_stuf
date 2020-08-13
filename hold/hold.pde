 Ball[] balls;

void setup() {
  size(600,600,P2D);
  //fullScreen(P2D);
  balls = new Ball[6];
  for(int i = 0; i < balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(0);
  for(Ball curr : balls) {
    curr.step();
    //curr.render();
  }
  loadPixels();
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      int R1 = round(map(dist(i,j,balls[0].pos.x,balls[0].pos.y),0,balls[0].range,255,0));
      int R2 = round(map(dist(i,j,balls[3].pos.x,balls[3].pos.y),0,balls[3].range,255,0));
      int R = max(R1,R2);
      
      int G1 = round(map(dist(i,j,balls[1].pos.x,balls[1].pos.y),0,balls[1].range,255,0));
      int G2 = round(map(dist(i,j,balls[4].pos.x,balls[4].pos.y),0,balls[4].range,255,0));
      int G = max(G1,G2);
      
      int B1 = round(map(dist(i,j,balls[2].pos.x,balls[2].pos.y),0,balls[2].range,255,0));
      int B2 = round(map(dist(i,j,balls[5].pos.x,balls[5].pos.y),0,balls[5].range,255,0));
      int B = max(B1,B2);
      
      color c = color(R,G,B);
      pixels[(width*j)+i] = c;
    }
  }
  updatePixels();
  /*if(frameCount % 60 == 0) {
    exit();
  } else {
    saveFrame("/out/###.tga");
  }*/
  
}
