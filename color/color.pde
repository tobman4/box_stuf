import processing.pdf.*;

int B_walk = 0;
int B_step = 1;

boolean layer_pulse = true;
boolean pulse_dir = true;
int B_layer = 1;

void setup() {
  size(600,600,P2D);
  //fullScreen(P2D);
}

void draw() {
  cool3();
  if(layer_pulse && frameCount%2 == 0) {
    if(B_layer == 255 || B_layer == 0) {
      pulse_dir = !pulse_dir;
    }
    _keyPressed(38 + (pulse_dir ? 0 : 2));
  }
  if(mousePressed) {
    int R = round(map(mouseX,0,width,0,255));;
    int G = round(map(mouseY,0,height,0,255));;
    int B = B_layer;
    String str = "R: " + R + " G: " + G + " B: " + B;
    text(str,mouseX,mouseY);
  }
}
void cool3 () {
  
  int diag_len = round(sqrt(pow(width,2)+pow(height,2)));
  println(diag_len);
  
  loadPixels();
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      int R = round(map(dist(i,j,width,0),0,width,255,0));
      int G = round(map(dist(i,j,width,height),0,diag_len,255,0));
      int B = round(map(dist(i,j,0,width),0,height,255,0));
      pixels[(width*j)+i] = color(R,G,B);
    }
  }
  updatePixels();
}
void cool2() {
  loadPixels();
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      int R = round(map(i,0,width,0,255));
      int G = round(map(j,0,height,0,255));
      int B = B_layer;
      pixels[(width*j)+i] = color(R,G,B);
    }
  }
  updatePixels();
}

void cool() {
  loadPixels();
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      int R = round(map(i,0,width,0,255));
      int G = round(map(j,0,height,0,255));
      B_walk += B_step;
      if(B_walk >= 255 || B_walk <= 0) {
        B_step = -B_step;
      }
      pixels[(width*j)+i] = color(R,G,B_walk);
    }
  }
  updatePixels();
}


void keyPressed() {
  _keyPressed(keyCode);
}

void _keyPressed(int k) {
    switch(k) {
    case 38:
      B_layer++;
      break;
    case 40:
      B_layer--;
      break;
    case 32:
      layer_pulse = !layer_pulse;
      break;
    default:
      println(keyCode);
      break;
  }
  if(B_layer < 0) {
    B_layer = 255;
  } else if(B_layer > 255) {
    B_layer = 0;
  }
}
