abstract class Tile {
  
  PVector pos;
  int size = 15;
  
  Tile(int x, int y) {
    pos = new PVector(x,y);
  }
  
  abstract void render();
}
