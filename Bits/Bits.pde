boolean[] bits;

color on = color(255,255,255);
color off = color(0,0,0);

void setup() {
  //size(100,1000);
  fullScreen();
  
  bits = new boolean[width];
  
  for(int i = 0; i < bits.length; i++) {
    bits[i] = false;
  }
}

void draw() {
  long start = millis();
  loadPixels();
  for(int i = 0; i < height-1; i++) {
    for(int j = 0; j < width; j++) {
      
       pixels[(width*i)+j] = pixels[(width*(i+1))+j];
    }
  }
  boolean all_on = true;
  for(int i = 0; i < width; i++) {
    if(!bits[i]) {
      all_on = false;
    }
    int r = round(random(127,255));
    int g = round(random(127,255));
    int b = round(random(127,255));
    pixels[(width*(height-1))+i] = bits[i] ? color(r,g,b) : off;
  }
  
  if(all_on) {
    noLoop();
    return;
  }
  
  updatePixels();
  
  for(int i = bits.length-1; i >= 0; i--) {
    bits[i] = !bits[i];
    if(bits[i]) {
      break;
    }
  }
  println("Loop time = ", (millis() - start));
}
