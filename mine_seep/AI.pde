class AI {
  
  Game g;
  
  boolean is_on = false;
  boolean did_open = true;
  
  AI(Game game) {
    g = game;
  }
  
  void step(boolean force) {
    
    if(!is_on && force) {
      return;
    }
    
    if(g.is_lost) {
      g.reset();
      return;
    } else if(g.is_fist_move()) {
      g.open_random();
    }
    
    /*
    if(!did_open) {
      g.open_random(true);
    }
    */
    
    for(Cell i[] : g.grid) {
      for(Cell c : i) {
        if(c.is_open && !c.is_flaged) {
          did_open = test_cell(c);
          if(did_open) {
            return;
          }
        }
      }
    } 
  }
  
  boolean test_cell(Cell c) {
    PVector grid_pos = g.get_grid_pos(c);
    Cell[] frends = g.get_frends((int)grid_pos.x,(int)grid_pos.y);
    int unopend = 0;
    int flaged = 0;
    for(Cell f : frends) {
      if(f.is_flaged) {
        flaged++;
      } else if(!f.is_open) {
        unopend++;
      }
    }
    
    //FLAG
    if(c.count == unopend + flaged) {
      for(Cell f : frends) {
        if(!f.is_flaged && !f.is_open) {
          f.flag();
        }
      }
    }
    //FLAG END
    
    //OPEN
    if(flaged == c.count && unopend != 0) {
      for(Cell f : frends) {
        if(!f.is_open && !f.is_flaged) {
          PVector pos = g.get_grid_pos(f);
          Cell[] frend_frends = g.get_frends(int(pos.x),int(pos.y));
          f.open(frend_frends);
        }
      }
      return true;
    }
    //OPEN END
    
    return false;
  }
}
