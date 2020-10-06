class Game extends Obj {
  UI ui = null;
  
  boolean is_lost = false;
  
  Cell[][] grid;
  
  int cell_w;
  int cell_h;
  
  int bombs;
  
  Game(PVector p, PVector s, int w, int h,int bombs) {
    super(p,s);
    cell_w = int(s.x/w);
    cell_h = int(s.y/h);
    
    grid = new Cell[w][h];
    PVector cell_size = new PVector(cell_w, cell_h);
    push();
    translate(pos.x,pos.y);
    for(int i = 0; i < w; i++) {
      for(int j = 0; j < h; j++) {
        int x = cell_w*i;
        int y = cell_h*j;
        PVector cell_pos = new PVector(x,y);
        grid[i][j] = new Cell(cell_pos, cell_size);
        
      }
    }
    pop();
    
    this.bombs = bombs;
    
    for(int i = 0; i < bombs; i++) {
      int x = floor(random(0,grid.length));
      int y = floor(random(0,grid[0].length));
      grid[x][y].is_bomb = true;
    }
    
  }

  void render() {
    noFill();
    stroke(255,0,255);
    rect(pos.x,pos.y,size.x,size.y);
    
    if(ui != null) {
      ui.render();
    }
    
    push();
    translate(pos.x,pos.y);
    for(Cell[] i : grid) {
      for(Cell c : i) {
        c.render();
      }
    }
    pop();
    
  }

  void logic() {
   boolean no_opend;
   do { 
     no_opend = true;
     for(Cell[] i : grid) {
        for(Cell c : i) {
          if(c.to_open) {
            Cell[] frends = get_frends(int(c.pos.x/cell_w),int(c.pos.y/cell_h));
            c.open(frends);
            no_opend = false;
          }
        }
      }
     } while(!no_opend);
  }
  
  void reset() {
    is_lost = false;
    PVector cell_size = new PVector(cell_w, cell_h);
    
    push();
    translate(pos.x,pos.y);
    for(int i = 0; i < w; i++) {
      for(int j = 0; j < h; j++) {
        int x = cell_w*i;
        int y = cell_h*j;
        PVector cell_pos = new PVector(x,y);
        grid[i][j] = new Cell(cell_pos, cell_size);
        
      }
    }
    pop();
    
    for(int i = 0; i < bombs; i++) {
      int x = floor(random(0,grid.length));
      int y = floor(random(0,grid[0].length));
      grid[x][y].is_bomb = true;
    }  
  }
  
  PVector get_grid_pos(Cell c) {
    for(int i = 0; i < grid.length; i++) {
      for(int j = 0; j < grid[i].length; j++) {
        if(grid[i][j] == c) {
          return new PVector(i,j);
        }
      }
    }
    return null;
  }
  
  void _mousePressed(int x, int y, boolean is_rigth) {
    x = x/cell_w;
    y = (y-25)/cell_h;
    Cell c = get_cell(x,y);
    if(c != null && !is_rigth) {
      Cell[] hold = get_frends(x,y);
      c.open(hold);
      if(c.is_bomb) {
        is_lost = true;
      }
    } else if(c != null) {
      c.flag();
    }
  }
  
  void set_ui(UI u) {
    ui = u;
  }
  
  Cell get_cell(int x, int y) {
    try {
      return grid[x][y];
    } catch(Exception err) {
      return null;
    }
  }
  
  Cell[] get_frends(int x, int y) {
    /*
      TODO: FIX
    */
    ArrayList<Cell> out = new ArrayList<Cell>();
    
    out.add(get_cell(x-1,y-1));
    out.add(get_cell(x,y-1));
    out.add(get_cell(x+1,y-1));
    
    out.add(get_cell(x+1,y));
    out.add(get_cell(x-1,y));
    
    out.add(get_cell(x+1,y+1));
    out.add(get_cell(x,y+1));
    out.add(get_cell(x-1,y+1));
    
    
    Cell[] arr_out;
    int real_cell = 0;
    for(int i = out.size()-1; i >= 0; i--) {
      Cell curr = out.get(i);
      if(curr == null) {
        out.remove(curr);
      } else {
        real_cell++;
      }
    }
    arr_out = new Cell[real_cell];
    for(int i = 0; i < out.size(); i++) {
      Cell curr = out.get(i);
      arr_out[i] = curr;
    }
    
    return arr_out;
  }
  
  boolean is_fist_move() {
    for(Cell[] i : grid) {
      for(Cell c : i) {
        if(c.is_open) {
          return false;
        }
      }
    }
    return true;
  }
  
  void open_random(boolean f) {
    if(f) {
      open_random();
    } else {
      int x = floor(random(0,grid.length));
      int y = floor(random(0,grid[x].length));
      Cell[] frends = get_frends(x,y);
      grid[x][y].open(frends);
    }
  }
  
  void open_random() {
    int max_trys = 100;
    int i = 0;
    int target = 0;
    
    Cell testing;
    Cell[] frends;
    
    do {
      int x = floor(random(0,grid.length));
      int y = floor(random(0,grid[x].length));
      
      int bombs = 0;
      testing = get_cell(x,y);
      frends = get_frends(x,y);
      for(Cell c : frends) {
        if(c.is_bomb) {
          bombs++;
        }
      }
      i++;
    } while(i<max_trys && bombs != target);
    testing.open(frends);
  }
}
