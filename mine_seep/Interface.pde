class UI extends Obj {
  public UI(PVector p, PVector s) {
    super(p,s);
  }
  
  void render() {
    noFill();
    stroke(0,255,0);
    rect(pos.x,pos.y,size.x,size.y);
  }
  
  void logic() {
  }
}
