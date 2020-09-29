/*
--------------------------------------
   Author:      AGH, MAFLL
   Start date:  29-09-2020
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
public PageMaker pm = new PageMaker();

boolean loaded = false;
String[] loadingDots = {".", "..", "...", "....", "....."};
int dotIndex = 0;
PFont fontLoad;

void setup(){
  size(707,1000,JAVA2D);
  fontLoad = createFont("Verdana",50);
  frameRate(5);
  thread("load");
  m = new Movie(this,"lau.mp4");
  pm.init();
}

void draw(){
  background(100);
  if (loaded){
    pm.update();
  } else {
    textAlign(CENTER);
    textFont(fontLoad);
    text("LOADING", width/2, height/2);
    text(loadingDots[dotIndex], width/2, height/2+50);
    if (dotIndex < loadingDots.length-1) {
      dotIndex++;
    } else {
      dotIndex = 0;
    }
  }
  if(pm.currentPage != 0)    //stops the video, whenever the user is not on the front page
    m.stop();
  else
    m.loop();
}

void mousePressed(){
  if (loaded){
    pm.press();
  }
}

void mouseDragged() {
  if (loaded){
    pm.tech.drag();
  }
}

void mouseMoved() {
  pm.prevMin = pm.currMin;    //if the mouse is moved, the counter for returning to the front page, is reset
}

void movieEvent(Movie m) {
  m.read();
}

void load(){
  files.loadImages();
  frameRate(60);
  loaded = true;
}
