import processing.pdf.*;

int size = 2;
void setup () {
  size(400,400,PDF,"out.pdf");
  //fullScreen();
}

void draw() {
  background(0);
  stroke(255);
  for(int i = 0; i < width/size; i++) { 
    for(int j = 0; j < height/size; j++) {
      if(random(1) > 0.5) {
        line(size*i,size*j,(size*i)+size,(size*j)+size);
      } else {
        line((size*i)+size,size*j,size*i,(size*j)+size);
      }
    }
  }
  PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer
  if(frameCount >= 1) {
    exit();
  } else {
    pdf.nextPage();
  }
}
