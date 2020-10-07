int[][] grid;

static int grid_size = 4;
int W,H;

void setup() {
  size(500,500);
  
  grid = new int[grid_size][grid_size];
  for(int i = 0; i < grid.length; i++) {
    for(int j = 0; j < grid[i].length; j++) {
      grid[i][j] = 40;
    }
  }
  W = round(width/grid_size);
  H = round(height/grid_size);
  
  textSize(H/2.5);
  textAlign(CENTER, BOTTOM);
}

void draw() {
  long start = millis();
  for(int i = 0; i < grid.length; i++) {
    for(int j = 0; j < grid[i].length; j++) {
      noFill();
      stroke(255,0,255);
      rect(W*i,H*j,W,H);
      
      text(grid[i][j],W*i+W/2,H*j+H/2);
    }
  }
  
  println("Loop time: " + (millis() - start) + "ms");
}

void slide_rigth() {
  for(int j = 0; j < grid[0].length; j++) {
    for(int i = grid.length-1; i > 0; i--) {
      int curr = grid[i][j];
      int next = grid[i-1][j];
      
    }
  }
}
