abstract class Obj {
    PVector pos;
    PVector size;
    Obj(int x, int y,int w, int h) {
        pos = new PVector(x,y);
        size = new PVector(w,h);
    }

    boolean is_inside(int x,int y) {
        return (x > pos.x && x < pos.x+size.x && y > pos.y && y < pos.y+size.y);
    }

    abstract void render();
    abstract boolean pressed(int x, int y);
}