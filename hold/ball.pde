class Ball {
  int range = 300;
  PVector pos = new PVector(width/2,height/2);
  PVector vel = new PVector(0,0);
  
  boolean mouse_mode = false;
  
  Ball() {
    if(!DBG) {
      vel.x = random(-5,5);
      vel.y = random(-5,5);
    } else {
      vel.x = 0;
      vel.y = 0;
    }
  }
  
  void render() {
    fill(255);
    noStroke();
    ellipse(pos.x,pos.y,10,10);
    noFill();
    stroke(0,255,0);
    ellipse(pos.x,pos.y,range,range);
  }
  
  void step() {
    
    if(mouse_mode) {
      pos.x = mouseX;
      pos.y = mouseY;
    }
    
    if(pos.x+vel.x > width || pos.x+vel.x < 0) {
      vel.x = -vel.x;
    }
    if(pos.y+vel.y > height || pos.y+vel.y < 0) {
      vel.y = -vel.y;
    }
    pos.add(vel);
  }
}
