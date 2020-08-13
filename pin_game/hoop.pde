class Hoop extends Obj {

    boolean is_lifted = false;
    private color c;

    Hoop(int x, int y, int w) {
        super(x,y,w,hoop_h);
        c = color(random(1)*255,random(1)*255,random(1)*255);
        
    }

    void render() {
        fill(c);
        if(is_lifted) {
            pos.x = mouseX;
            pos.y = mouseY;
        }
        rect(pos.x,pos.y,size.x,size.y);
    }

    void pick_up() {
        is_lifted = true;
        lifted = this;
        
    }

    boolean pressed(int x, int y) {
        if(is_inside(x,y)) {
            pick_up();
        }
        return true;
    }
}

class Pre_hoop extends Hoop {
    Pre_hoop(int x, int y, int w) {
        super(x,y,w);
    }
}
