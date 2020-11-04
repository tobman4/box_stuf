PImage img;

void setup() {
  size(200,200);
  
  loadPixels();
  for(int i = 0; i < pixels.length; i++) {
    int r = round(random(255));
    int g = round(random(255));
    int b = round(random(255));
    pixels[i] = color(r,g,b); 
  }
  updatePixels();
  
}

void draw() {
  long start = millis();
  loadPixels();
  color last = pixels[pixels.length-1];
  for(int i = 0; i < pixels.length; i++) {
    color hold = pixels[i];
    pixels[i] = last;
    last = hold;
  }
  updatePixels();
  println("Loop time: " + (millis() - start) + "ms");
}
