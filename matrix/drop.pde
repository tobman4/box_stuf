class Drop {
  PVector pos;
  String chars;
  int fall_speed = 10;
  int len;
  int deep;
  boolean dead = false;
  
  final int max_length = 7;
  final int min_length = 3;
  final int text_size = 10;
  final int offset = 5;
  
  Drop() {
    pos = new PVector(random(0,width),0);
    len = round(random(min_length,max_length));
    fall_speed = int(random(10,25));
    for(int i = 0; i < len; i++) {
      chars += get_char();
    }
  }
  
  Drop(int x, int y) {
    pos = new PVector(x,y);
    len = round(random(min_length,max_length));
    for(int i = 0; i < len; i++) {
      chars += get_char();
    }
  }
  
  void render() {
    push();
    translate(pos.x,pos.y);
    textSize(text_size);
    fill(0, 143, 17);
    for(int i = 0; i < chars.length(); i++) {
      text(chars.charAt(i),0,(-text_size*i)-offset);
    }
    pop();
  }
  
  void step() {
    pos.y += fall_speed;
    chars = get_char() + chars.substring(0,chars.length()-1);
  }
  
  final String get_char() {
    int[][] char_space = {
      {161,255},
      {1121,1154},
      {33,54}
    };
    int i = int(random(char_space.length-1));
    int min = char_space[i][0];
    int max = char_space[i][1];
    return str(char(round(random(min,max))));
  }
}
