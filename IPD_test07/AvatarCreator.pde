class AvatarCreator {
  int size = 100;
  
  Avatar myAvatar;
  int x, y;
  Arrow[][] arrows;
  
  AvatarCreator (int xx, int yy) {
    x = xx;
    y = yy;
    myAvatar = new Avatar(x-size/12, y+size/3);
    arrows = new Arrow[2][files.heads.length];
  }
  
  void init() { //Create arrow buttons
    for (int ix = 0; ix < 2; ix++){
      for (int iy = 0; iy < files.heads.length; iy++){
        if ((ix+1)%2 == 0){ //Every second arrow points to the right
          arrows[ix][iy] = new Arrow(x-(size/2), y + (iy*size/2), false);
        } else {
          arrows[ix][iy] = new Arrow(x+(size/2), y + (iy*size/2), true);
        }
      }
    }
  }
  
  void press(){ //Check if one of the arrow buttons are pressed and add image index to the avatar
    for (int ix = 0; ix < 2; ix++){
      for (int iy = 0; iy < files.heads.length; iy++){
        if (arrows[ix][iy].hover){
          if ((ix+1)%2 == 0){ //The arrow to the right should add index the left subtracts
            myAvatar.addIndex(iy, 1);
          } else {
            myAvatar.addIndex(iy, -1);
          }
          break;
        }
      }
    }
  }
  
  void update () {
    if (pm.currentPage == 1){
      //fill(100);
      //rect(x-(size/2), y-(size/2), size*1.3, size*2);
      
      for (int ix = 0; ix < 2; ix++){ //Draw all arrows
        for (int iy = 0; iy < files.heads.length; iy++){
          arrows[ix][iy].update();
        }
      }
    }
    if (pm.currentPage == 1 || pm.currentPage == 2){
      myAvatar.update();
    }
  }
}

class Arrow {
  boolean hover = false;
  int size = 30;
  
  boolean right;
  int x, y;
  
  //Conditions
  boolean c1;
  boolean c2;
  
  Arrow(int xx, int yy, boolean r){
    x = xx;
    y = yy;
    right = r;
  }
  
  void update(){
    c1 = mouseX < (x+size*2) && mouseX > x;
    c2 = mouseY < (y+size*2) && mouseY > y;
    if (c1 && c2){
      fill(200);
      hover = true;
    } else {
      fill(255);
      hover = false;
    }
    
    if (right){
      triangle(x, y, x, y+size, x+size, y+(size/2));
    } else {
      triangle(x+size, y+size, x+size, y, x, y+(size/2));
    }
  }
}

class Avatar {
  float x;
  int y;
  float startX;
  int size = 50;
  float speed = 0;
  
  //Image indexes;
  int headIndex  = 0;
  int torsoIndex = 0;
  int legIndex   = 0;
  
  Avatar(int xx, int yy){
    x = xx;
    y = yy;
    startX = xx;
  }
  
  public void resetPos(){
    x = startX;
  }
  
  void addIndex(int id, int value){
    switch(id) {
      case 0:
        if (value > 0) {
          if ((headIndex+value) <= (files.heads.length-1)){
            headIndex += value;
          } else {
            headIndex = 0;
          }
        } else if (value < 0) {
          if ((headIndex+value) >= 0){
            headIndex += value;
          } else {
            headIndex = files.heads.length-1;
          }
        }
        break;
      case 1:
        if (value > 0) {
          if ((torsoIndex+value) <= (files.torsos.length-1)){
            torsoIndex += value;
          } else {
            torsoIndex = 0;
          }
        } else if (value < 0) {
          if ((torsoIndex+value) >= 0){
            torsoIndex += value;
          } else {
            torsoIndex = files.torsos.length-1;
          }
        }
        break;
      case 2:
        if (value > 0) {
          if ((legIndex+value) <= (files.legs.length-1)){
            legIndex += value;
          } else {
            legIndex = 0;
          }
        } else if (value < 0) {
          if ((legIndex+value) >= 0){
            legIndex += value;
          } else {
            legIndex = files.legs.length-1;
          }
        }
        break;
    }
  }
  
  void update(){
    x += speed;
    
    //Draw images
    image(files.heads[headIndex], x, y-size, size, size);
    image(files.torsos[torsoIndex], x, y, size, size);
    image(files.legs[legIndex], x, y+size, size, size);
  }
}
