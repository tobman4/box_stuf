void keyPressed() {
  switch(keyCode) {
    
    case 37:
      if(vel.X != 0) {
        break;
      }
      vel = new Point(-1,0);
      break;
      
    case 39:
      if(vel.X != 0) {
        break;
      }
      vel = new Point(1,0);
      break;
      
    case 38:
      if(vel.Y != 0) {
        break;
      }
      vel = new Point(0,-1);
      break;
      
    case 40:
      if(vel.Y != 0) {
        break;
      }
      vel = new Point(0,1);
      break;
    
      case 32:
        snake_length++;
        break;
    
     default:
       if(DBG) {
         println("Key not in use: ", keyCode);
       }
       break;
  }
}
