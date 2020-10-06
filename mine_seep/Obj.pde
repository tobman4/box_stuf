abstract class Obj {

    PVector pos,size;

    Obj(PVector p, PVector s) {
        pos = p;
        size = s;
    }

    abstract void render();
    abstract void logic();

}
