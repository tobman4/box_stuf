import processing.pdf.*;

int[] nr;

color[] rainbow = new color[] {
  color(148,0,211),
  color(75,0,130),
  color(0,0,255),
  color(0,255,0),
  color(255,127,0),
  color(255,0,0)
};

PGraphicsPDF pdf;

void setup() {
  size(600,600);
  String[] lines = loadStrings("PI.txt");
  lines = lines[0].split("");
  
  nr = new int[lines.length];
  for(int i = 0; i < nr.length; i++) {
    nr[i] = int(lines[i]);
  }
  pdf = (PGraphicsPDF)beginRecord(PDF, "Lines.pdf");
}

void draw() {
  background(0);
  stroke(255);
  boolean done = false;
  for(int i = 0; i < height; i++) {
    int index = (height*frameCount)+i;
    if(index >= nr.length) {
      done = true;
      endRecord();
      exit();
      break;
    } else {
      println(index,"/",nr.length, " = ", nr[i]);
    }
    stroke(rainbow[index%rainbow.length]);
    int len = round(map(nr[index],0,9,0,width));
    line(0,i,len,i);
  }
  
  if(!done) {
    pdf.nextPage();
  }
}
