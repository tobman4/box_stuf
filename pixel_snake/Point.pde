class Point {
  
  int X,Y;
  
  Point() {
    X = 0;
    Y = 0;
  }
  
  Point(int XI, int YI) {
    X = XI;
    Y = YI;
  }
  
  Point(Point p) {
    X = p.X;
    Y = p.Y;
  }
  
  void set(Point p) {
    X = p.X;
    Y = p.Y;
  }
  
  Point copy() {
    return new Point(X,Y);
  }
  
}
