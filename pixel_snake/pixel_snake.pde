ArrayList<Point> snake = new ArrayList<Point>();
int snake_length = 1;

Point vel = new Point(1,0);
Point food = null;

color snake_color = color(255,0,0);
color food_color = color(0,255,0);

boolean dead = false;
boolean DBG = true;

void setup() {
  //size(600,600);
  fullScreen();
  snake.add(new Point(width/2,height/2));
  //place_food();
  food = new Point(width/2+50,height/2);
  
}

void draw() {
  
  background(0);
  
  loadPixels();
  
  
  pixels[(width*food.Y)+food.X] = food_color;
  
  //Point p = snake.get(0);
  //pixels[(width*p.Y)+p.X] = color(0,0,255);
  
  for(int i = 0; i < snake.size(); i++) {
    Point p = snake.get(i);
    if(p.X == -99) {
      continue;
    }
    pixels[(width*p.Y)+p.X] = snake_color;
  }
  updatePixels();
  
  if(dead) {
    return;
  }
  
  Point head_c = snake.get(0).copy();
  Point head = snake.get(0);
  
  Point last = head_c.copy();
  for(int i = 1; i < snake_length; i++) {
      
      if(i >= snake.size()) {
        snake.add(new Point(-99,0));
        continue;
      }
    
      Point curr = snake.get(i);
      
      if(curr.X == head.X && curr.Y == head.Y) {
        dead = true;
      }
      
      Point h = new Point(curr);
      curr.set(last);
      last = h;
      
   }
  
  if(head.X > 0 && head.X < width && head.Y > 0 && head.Y < height) {
    head.X += vel.X;
    head.Y += vel.Y;
    
    if(head.X == food.X && head.Y == food.Y) {
      snake_length++;
      place_food();
    }
  }
}

void place_food() {
  boolean is_ok;
  int x,y;
  do {
    
    x = round(random(0,width));
    y = round(random(0,height));
    
    is_ok = true;
    for(int i = 0; i < snake.size(); i++) {
      Point curr = snake.get(i);
      if(x == curr.X && y == curr.Y) {
        is_ok = false;
        break;
      }
    }
  }while(!is_ok);
  food = new Point(x,y);
}
