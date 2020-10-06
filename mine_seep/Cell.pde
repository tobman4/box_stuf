class Cell  extends Obj {
  
  boolean DBG = false;
  boolean is_open = false;
  boolean is_bomb = false;
  boolean is_flaged = false;
  boolean to_open = false;
  
  int count = 0;
  int text_size = 0;
  
  Cell(PVector p, PVector s) {
    super(p,s);
  }
  
  void render() {
    stroke(0);
    
    if(!is_bomb && is_open && count != 0) {
      fill(255);
      textSize(size.y);
      textAlign(CENTER, BOTTOM);
      text(count,pos.x+size.x/2,pos.y+size.y);
    } else if(is_bomb && is_open) {
      fill(0);
      ellipse(pos.x+size.x/2,pos.y+size.y/2,size.x/2,size.x/2);
    }
    
    if(is_flaged) {
      fill(255,0,0);
    } else if(!is_open) {
      fill(255);
    }else {
      noFill();
    }
    rect(pos.x,pos.y,size.x,size.y);
    
  }
  
  void open(Cell[] frends) {
    
    if(is_open || is_flaged) {
      to_open = false;
      return;
    }
    
    is_open = true;
    println(frends.length);
    for(Cell c : frends) {
      if(c.is_bomb) {
        count++;
      }
    }
    if(count == 0 && !is_bomb) {
      for(Cell c : frends) {
        c.to_open = true;
      }
    }
  }
  
  void flag() {
    is_flaged = !is_flaged;
  }
  
  void logic() {
  }
}
