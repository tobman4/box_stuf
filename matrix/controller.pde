class Controller {
  ArrayList<Drop> drops = new ArrayList<Drop>();
  
  final int max_drops = 1000;
  
  Controller() {
  }
  
  void render() {
    for(Drop curr : drops) {
      curr.render();
    }
  }
  
  void step() {
    for(int i = drops.size(); i > 0; i--) {
      Drop curr = drops.get(i-1);
      curr.step();
      if(curr.pos.y-(curr.text_size*curr.len) > height) {
        drops.remove(curr);
      }
    }
    if(drops.size()-1 < max_drops && random(100) < 50) {
      drops.add(new Drop());
    }
  }
}
