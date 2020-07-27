int colums,rows;
float size = 50;
float[] offset;
float[] offset_speed;
color[][] c;

int colum_selected = 0;

void settings() {
  boolean fs = false;
  int w = 600;
  int h = 600;
  try {
    String[] file_data = loadStrings("settings.config");
    for(String line : file_data) {
      line = line.replace(" ","");
      String[] s = line.split("=");
        switch(s[0]) {
          case "boxsize":
            size = int(s[1]);
            size = min(size,200);
            size = max(size,0);
            break;
         case "fullscreen":
           if(int(s[1]) == 1) {
             fs = true;
           }
           break;
        case "windoww":
          w = int(s[1]);
          break;
       case "windowh":
          h = int(s[1]);
          break;
        }
    }
  } catch(Exception err) {
    println(err);
    exit();
  }
  
  if(fs == true) {
    fullScreen();
  } else {
    size(w,h);
  }

}

void setup() {

  
  rows = round(height/size);
  colums = round(width/size);
  println("Size: " + size);
  println("Colums: " + colums);
  println("Rows: " + rows);
  
  c = new color[colums][rows+1];
  
  offset = new float[colums];
  offset_speed = new float[colums];
  for(int i = 0; i < offset.length; i++) {
    offset[i] = 0;
    offset_speed[i] = random(.01,.5);
  }
  
  for(int i = 0; i < c.length; i++) {
    for(int j = 0; j < c[i].length; j++) {
      c[i][j] = color(random(0,255),random(0,255),random(0,255));
    }
    c[i][0] = c[i][rows];
  }
  
}

void draw() {
  background(0);
  delay(1);
  noStroke();
  for(int i = 0; i < colums; i++) {
    for(int j = 0; j < rows+1; j++) {
      fill(c[i][j]);
      rect(size*i,((size*j)+offset[i])-size,size,size+2);
      if(offset[i] >= size+1) {
        offset[i] -= size;
        color last = c[i][rows-1];
        color h;
        for(int l = 0; l < c[i].length; l++) {
          h = c[i][l];
          c[i][l] = last;
          last = h;
        }
      } else {
        offset[i] += offset_speed[i];
      }
    }
  }
  fill(255,0,255,150);
  rect(size*colum_selected,0,size,height);
}

void keyPressed() {
  switch(keyCode) {
    case 37:
      colum_selected--;
      break;
    case 39:
      colum_selected++;
      break;
    case 38:
      offset_speed[colum_selected] += .05;
      break;
    case 40:
      offset_speed[colum_selected] -= .05;
      break;
  }
  
  if(colum_selected < 0) {
    colum_selected = offset_speed.length-1;
  } else if(colum_selected > offset_speed.length-1) {
    colum_selected = 0;
  }
  offset_speed[colum_selected] = min(offset_speed[colum_selected],1);
  offset_speed[colum_selected] = max(offset_speed[colum_selected],0);
}
