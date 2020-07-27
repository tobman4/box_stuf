import java.util.Arrays;
import java.util.Collections;
import java.util.List;

PImage img;
int swaps;
int index;
int [][] swap_record;

int mode = 0;
final int cats = 6;
final int dogs = 6;
int last_pic = -1;
boolean fixes = true;

void setup() {
  //size(600,600);
  fullScreen();
  get_img();
  swaps = (img.width*img.height)*3;
  shuffel();
  thread("fix");
  
}

void draw() {
  image(img,0,0);
  if(fixes) {
    get_img();
    image(img,0,0);
    shuffel();
    thread("fix");
  }
  
  
}

void get_img() {
  String str = "";
  int i = -1;
  do {
    switch(mode) {
      case 0: //dog mode
        i = round(random(0,dogs));
        str = "dog" + i;
        break;
      case 1: //cat mode
        i = round(random(0,cats));
        str = "cat" + i;
        break;
      default:
        println("ERROR: " + mode + " is not a valid mode");
      case 99:
        str = "test";
        break;
    }
  } while(i == last_pic);
  last_pic = i;
  img = loadImage(str + ".jpg");
  img.resize(width,height);
}

void fix() {
  index = swap_record.length-1;
  while(index >= 0) {
    img.loadPixels();
    color hold = img.pixels[swap_record[index][0]];
    img.pixels[swap_record[index][0]] = img.pixels[swap_record[index][1]];
    img.pixels[swap_record[index][1]] = hold;
    img.updatePixels();
    index--;
    delay(0);
  }
  delay(200);
  fixes = true;
}

void shuffel() {
  img.loadPixels();
  swap_record = new int[swaps][2];
  for(int i = 0; i < swaps; i++) {
    int A = floor(random(0,img.pixels.length));
    int B = floor(random(0,img.pixels.length));
    color hold = img.pixels[B];
    img.pixels[B] = img.pixels[A];
    img.pixels[A] = hold;
    swap_record[i][0] = A;
    swap_record[i][1] = B;
  }
  img.updatePixels();
  fixes = false;
}
