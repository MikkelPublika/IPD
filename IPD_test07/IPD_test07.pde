/*
--------------------------------------
   Author:      AGH, MAFLL
   Start date:  28-09-2020
   End date:    
   Purpose:     To make a looping page
                turner
   
   Scripts:     > IPD_test07.pde (main)
                > AvatarCreator.pde
                > Files.pde
                > PageMaker.pde
--------------------------------------
*/
import processing.video.*;
Movie m;

public Files files = new Files();
public AvatarCreator ac;
PageMaker pm = new PageMaker();

void setup() {
  size(707,1000);
  m = new Movie(this,"p0_video.mp4");
  m.loop();
  files.loadImages();
  pm.init();
}

void draw() {
  pm.update();
}

void mousePressed() {
  pm.press();
}

void mouseDragged() {
  pm.tech.drag();
}

void movieEvent(Movie m) {
  m.read();
}
