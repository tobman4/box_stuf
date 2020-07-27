//import processing.pdf.*;

int len = 200;
int max = 22;
int deg = 10;

void setup() {
  size(1000,1000);
  
}

void draw() {
  background(0);
  translate(width/2,height);
  stroke(255);
  strokeWeight(1);
  draw_line(1);
  //exit();
}

void draw_line(int index) {
  if(index >= max) {
    return;
  }
  line(0,0,0,-len/index);
  translate(0,-len/index);
  rotate(radians(deg));
  draw_line(index+1);
  rotate(radians(-(deg*2)));
  draw_line(index+1);
  rotate(radians(deg));
  translate(0,len/index);
}
