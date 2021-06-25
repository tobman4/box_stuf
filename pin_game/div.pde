abstract class Obj {
    PVector pos;
    PVector size;

    boolean DBG = false;

    Obj(int x, int y,int w, int h) {
        pos = new PVector(x,y);
        size = new PVector(w,h);
    }

    boolean is_inside(int x,int y) {
        return (x > pos.x && x < pos.x+size.x && y > pos.y && y < pos.y+size.y);
    }

    boolean doOverlap(Obj o) {
        if (pos.x >= o.pos.x || o.pos.x >= pos.x+size.x) { 
            return false; 
        }
        if (pos.y <= o.pos.y+o.size.y || o.pos.y+o.size.y <= pos.y+size.y) { 
            return false; 
        } 
  
        return true; 
    } 

    abstract void render();
    abstract boolean pressed(int x, int y);
}