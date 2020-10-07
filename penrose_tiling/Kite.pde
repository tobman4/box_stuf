class Kite extends Tile {
  Kite(int x, int y) {
    super(x,y);
  }
  
  void render() {
    push();
    
    noSmooth();
    stroke(255);
    translate(pos.x,pos.y);
    point(0,0);
    
    beginShape();
    vertex(0,0);
    rotate(radians(75));
    vertex(25,0);
    rotate(radians(75));
    vertex(25,25);
    endShape();
    pop();
  }
}
