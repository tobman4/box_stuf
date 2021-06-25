class Pin extends Obj {
    ArrayList<Hoop> hoops = new ArrayList<Hoop>();

    Pin(int x, int y) {
        super(x,y,50,height-y);
    }

    void render() {
        if(DBG) {
            fill(255,0,255);
        } else {
            fill(100);
        }
        stroke(0);
        rect(pos.x,pos.y,size.x,size.y);
        
        for(Hoop curr : hoops) {
            curr.render();
        }
    }

    PVector get_pos(int w) {
        float y = (height-hoop_h)-hoop_h*hoops.size();
        float x = pos.x-w/4;
        return new PVector(x,y);
    }

    void add(Hoop h) {
        h.pos = get_pos(int(h.size.x));
        hoops.add(h);
    }

    boolean pressed(int x, int y) {
        if(!is_inside(x,y)) {
            return false;
        }
        for(Hoop curr :  hoops) {
            if(curr.pressed(x,y)) {
                break;
            } 
        }
        return true;
    }
}