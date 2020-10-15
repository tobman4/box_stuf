color ai;
int[] user_c;

int pointer_index = 0;

void setup() {
  size(550,300);
  ai = new_color();
  user_c = new int[3];
  user_c[0] = 100;
  user_c[1] = 100;
  user_c[2] = 100;
}

void draw() {
  rectMode(CENTER);
  textSize(33/2);
  background(0);
  stroke(100);
  
  //target box
  fill(ai);
  rect(150,height-150,100,100);

  //show full sat
  fill(255,0,0);
  rect(width/2-33,height-150-33,33,33);
  fill(0,255,0);
  rect(width/2-33,height-150,33,33);
  fill(0,0,255);
  rect(width/2-33,height-150+33,33,33);
  
  //user color
  fill(user_c[0],0,0);
  rect(width/2+33,height-150-33,33,33);
  fill(0,user_c[1],0);
  rect(width/2+33,height-150,33,33);
  fill(0,0,user_c[2]);
  rect(width/2+33,height-150+33,33,33);
  
  //pointer
  switch(pointer_index) {
    case 0:
      fill(user_c[0],0,0);
      break;
    case 1:
      fill(0,user_c[1],0);
      break;
    case 2:
      fill(0,0,user_c[2]);
      break;
  }
  ellipse(width/2,height-150-33+(33*pointer_index),33,33);
  fill(255);
  text(user_c[pointer_index],width/2-33/2,height-150-33+(33*pointer_index));
  
  
  //user box
  fill(user_c[0],user_c[1],user_c[2]);
  rect(width-150,height-150,100,100);
  
}

void keyPressed() {
  if(keyCode == 40) {
    pointer_index++;
    if(pointer_index >= 3) {
      pointer_index = 0;
    }
    return;
  } else if(keyCode == 38) {
    pointer_index--;
    if(pointer_index < 0) {
      pointer_index = 2;
    }
    return;
  }
  
  if(keyCode == 39 && user_c[pointer_index] < 255) {
    user_c[pointer_index]++;
  } else if(keyCode == 37 && user_c[pointer_index] > 0) {
    user_c[pointer_index]--;
  }
}

color new_color() {
  int r = round(random(255));
  int g = round(random(255));
  int b = round(random(255));
  return color(r,g,b);
}
