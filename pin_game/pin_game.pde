Pin[] pins;
Hoop lifted;

int hoop_h = 25;

void setup() {
    size(600,600);
    pins = new Pin[3];
    pins[0] = new Pin(50,300);
    pins[1] = new Pin(300,300);
    pins[2] = new Pin(500,300);
    pins[1].add(new Hoop(0,0,100));
}

void draw() {
    background(0);
    for(Pin curr : pins) {
        curr.render();
    }
    if(lifted != null) {
        for(Pin curr : pins) {
            curr.DBG = curr.doOverlap(lifted);
        }
    }
}

void mousePressed() {
    for(Pin curr : pins) {
        curr.pressed(mouseX,mouseY);
    }
}