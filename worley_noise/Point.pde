class Point {
  int X = 0;
  int Y = 0;
  
  Point(int x, int y) {
    this.X = x;
    this.Y = y;
  }
  
  void render() {
    push();
    translate(this.X,this.Y);
    rect(0,0,5,5);
    pop();
  }  
}
