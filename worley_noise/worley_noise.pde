int seed = 1;
int points = 15;
ArrayList<Point> point_list = new ArrayList<Point>();

int max_dist = 1000;

int DBG = 0;

void setup() {
  //size(600,600,P2D);
  fullScreen();
  //randomSeed(seed);
  for(int i = 0; i < points; i++) {
    Point curr = new Point(int(random(width)),int(random(height)));
    point_list.add(curr);
  }
}

void draw() {
  background(0);
  setpixel();
  if(DBG >= 2) {
    for(int i = 0; i < point_list.size(); i++) {
      Point curr = point_list.get(i);
      curr.render();
    }
  }
  //noLoop();
}


void setpixel() {
  loadPixels();

  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      float best_dist = 999999999;
      for(int l = 0; l < point_list.size(); l++) {
        Point curr = point_list.get(l);
        float dist = dist(i, j, curr.X, curr.Y);
        best_dist = min(dist,best_dist);
      }
      float c = map(best_dist,0,max_dist,0,255);
      pixels[(j*width) + i] = color(c,c,c);
    }
  }

  updatePixels();
}

void keyPressed() {
  switch(keyCode) {
    case 38:
      Point p = new Point(int(random(width)),int(random(height)));
      point_list.add(p);
      break;
    case 40:
      if(point_list.size() >= 1) {
        point_list.remove(point_list.size()-1);
      }
      break;
    case 39:
      max_dist += 15;
      break;
    case 37:
      max_dist -= 15;
      break;
    default:
    println("Key: " + keyCode);
      break;
  }
}
