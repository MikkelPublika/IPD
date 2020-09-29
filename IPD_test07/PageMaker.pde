//> class for creating other objects
class PageMaker {
  int numOfPages = 4;
  int currentPage = 0;    //change this (0-3) to begin on the desired page
  int prevMin,currMin;
  
  public AvatarCreator ac;

  //> objects of type 'Page array', 'Button' and 'Tech' are made
  Page[] pages = new Page[numOfPages];    //an array (list) with name 'pages' and length 'numOfPages' containing the pages is made
  Button btn = new Button(620,920,75,75);    //the continue button with name 'btn' is created with arguments for position and size
  Tech tech;    //the technical interactive with name 'tech' is made
  JobFade job01 = new JobFade(25,530,460);
  EndPage end = new EndPage(500,800,120);

  //> custom function for initialization (init) code
  void init() {
    noStroke();
    for (int i = 0; i < pages.length; i++) {    //the Page array is filled with pages
      switch(i) {
        case 2:
          pages[i] = new Page(width/2, height*.1, files.titles[i],100,200,files.bodyTexts[i]);
          ac = new AvatarCreator(width/2,700);
          ac.init();
          tech = new Tech(ac.myAvatar);
        default:
          pages[i] = new Page(width/2, height*.1, files.titles[i],100,200,files.bodyTexts[i]);
      }
    }
    prevMin = minute();
  }

  //> custom function for continuous code
  void update() {
    currMin = minute();
    if((currMin - prevMin) >= 3)    //if no interaction in 3 minutes, the front page is loaded (also see IPD_final01, 'mouseMoved()')
      currentPage = 0;
      
    image(files.bgImg,0,0,width,height);    //bg image is drawn
    if(currentPage == 0) {
      image(m,0,0,707,1000);
    }
    
    pages[currentPage].update();    //the update function from the current page is run
    if(ac != null)
      ac.update();

    if(currentPage == 2) {
      tech.update();    //if the current page is the 3rd, the update function from 'tech' is run
    }
    else if(currentPage == 3)
      end.update();
    else
      ac.myAvatar.resetPos();

    if(currentPage != 0) {
      job01.prevSec = job01.currSec;
    }
    if(currentPage != 2)
      tech.speed = 0;
    
    cursor(ARROW);
    btn.update();    //update function for the button
  }

  //> code that are to be run whenever the button (btn) is pressed
  void press() {
    if (ac != null)
      ac.press();

    if (btn.cx && btn.cy)    //checks if mouse is hovering over the button
      currentPage++;    //if so, the next page will load
    if (currentPage >= pages.length)    //if beyond the length of the array of pages, we go back to the beginning of the array
      currentPage = 0;
    end.press();
  }
}

//> class for creating pages
class Page {
  float titleX, titleY;    //the coordinates for the headline
  String titleText;    //string containing the title itself
  PFont titleFont;    //the font of the title

  float bodyX, bodyY;    //the coordinates for the body text
  String bodyText;
  PFont bodyFont;

  Page(float tx, float ty, String tt, float bx, float by, String bt) {    //constructer dictating what variables must be passed in the parentheses, when an object of type 'Page' is created (see line x1,x2)
    titleX = tx;    //the local variables within this class is set equal to that of the arguments from the constructor (see line x3)
    titleY = ty;
    titleText = tt;
    bodyX = bx;
    bodyY = by;
    bodyText = bt;
  }

  //> continuous code
  void update() {
    //title outline
      fill(0,240);
      rect(180,50,350,75,5);
    //body text outline
      fill(0,230);
    if(pm.currentPage == 0) {
      pm.job01.update();
    }
    else if(pm.currentPage == 1) {
      rect(80,170,530,330,15);
      rect(290,675,155,170,15);    //outline of the creative interactable
    }
    else if(pm.currentPage == 2) {
      rect(80,170,530,350,15);
      rect(0,605,707,240);    //outlines the technical interactable
    }
    else if(pm.currentPage == 3)
      rect(80,170,540,335,15);
    
    textAlign(CENTER);    //title (headline) is drawn
    titleFont = loadFont("CenturyGothic-Bold-54.vlw");
    textFont(titleFont);
    fill(255);
    text(titleText, titleX, titleY);
    
    textAlign(LEFT);
    bodyFont = loadFont("CenturyGothic-Bold-24.vlw");
    textFont(bodyFont);
    fill(255);
    text(bodyText,bodyX,bodyY);
  }
}

//> class for creating button(s)
class Button {
  int startX,startY,sizeX,sizeY;    //coordinates as well as size of the button

  boolean cx, cy;    //conditions (c) for checking whether the mouse is hovering over the button
  boolean hover = false;    //by default, the mouse will not be hovering over the button, so this is set to false

  Button(int x, int y, int sx, int sy) {    //constructer
    startX = x;
    startY = y;
    sizeX = sx;
    sizeY = sy;
  }

  void update() {
    image(files.btnImg, startX, startY, sizeX, sizeY);    //the image for the button is drawn
    isHovering();
  }
  
  void isHovering() {
    cx = mouseX > startX && mouseX < startX+sizeX;    //conditions for checking whether the mouse hovers the button, are set
    cy = mouseY > startY && mouseY < startY+sizeY;
    if (cx && cy) {    //if conditions are met, (the color of the button changes, and) the 'hover' bool (boolean) is set to true
      cursor(HAND);
      fill(0,100);
      ellipse(startX+sizeX/2,startY+sizeY/2,sizeX,sizeY);
      if(mousePressed) {
        fill(0,200);
        ellipse(startX+sizeX/2,startY+sizeY/2,sizeX,sizeY);
      }
    }
  }
}

class JobFade {
  float jobX01,jobX02;
  float jobY;
  int alpha01 = 255;
  int alpha02 = 0;
  int prevSec,currSec;
  float fadeSpeed = 7;
  
  boolean showing01,showing02;
  
  int i = 0;
  int j = 3;
  
  JobFade(float x01, float x02, float y) {
    jobX01 = x01;
    jobX02 = x02;
    jobY = y;
    prevSec = second();
    showing01 = true;
    showing02 = false;
  }
  
  void update() {
    currSec = second();
    if(prevSec > currSec)
      prevSec -= 60;
    
    if((currSec - prevSec) >= 5) {
      if(showing01) {
        alpha01-=fadeSpeed;
        alpha02+=fadeSpeed;
        if(alpha01 <= 0) {
          showing01 = false;
          showing02 = true;
          prevSec = second();
          i++;
        }
      }
      if(!showing01) {
        alpha01+=fadeSpeed;
        alpha02-=fadeSpeed;
        if(alpha01 >= 255) {
          showing01 = true;
          showing02 = false;
          prevSec = second();
          j++;
        }
      }
      /*if(showing02 && !showing01) {
        alpha01+=fadeSpeed;
        alpha02-=fadeSpeed;
        if(alpha01 >= 255)
          showing01 = true;
      }*/
    }
    if(i >= (files.jobTitles.length / 2))
      i = 0;
    if(j >= files.jobTitles.length)
      j = 3;
    println(i,j);
    fill(0,alpha01);
    text(files.jobTitles[i],jobX01,jobY);
    fill(0,alpha02);
    text(files.jobTitles[j],jobX02,jobY);
  }
}

//> class structure for the technical interactive
class Tech {
  int x = 260;    //variables for placement of the hoverable area
  int xEnd = 445;
  int l = xEnd - x;
  int y = 630;
  int yEnd = 668;
  int h = yEnd - y;
  int c = y+(h/2);

  float speed = 0;
  String speedString;
  String code;
  
  boolean c1,c2;    //conditions (c) for checking whether the mouse is hovering over the interactable code
  boolean hover;    //by default, the mouse will not be hovering over the interactable, so this is set to false
  
  int i = 0;
  boolean trans = false;
  
  Avatar myAvatar;
  
  Tech(Avatar avatar) {
    myAvatar = avatar;
  }

  void update() {
    displaySpeed();
    isHovering();
    if(!hover && speed == 0)
      pressAnim();
    hover = false;
  }
  
  void drag() {
    if(c2)
      speed += (mouseX - pmouseX) * .1;
  }
  
  void displaySpeed() {
    if(pm.currentPage != 2)
      speed = 0;
    
    speedString = nf(speed,0,1);
    code = "int speed = " + speedString;
    textAlign(CENTER,TOP);
    text(code,width/2,y+10);
    textAlign(LEFT);
    
    myAvatar.speed = speed;
    
    speed = constrain(speed, -5,5);
    if(speed < 0 && speed > -.1 || speed > 0 && speed < .1)
      speed = 0;
  }
  
  void isHovering() {
    c1 = mouseX <= x+l && mouseX >= x;    //conditions for checking whether the mouse hovers the interactable code, are set
    c2 = mouseY <= y+h && mouseY >= y;
    if(c1 && c2) {    //the interactable is hovered over
      hover = true;
      fill(255,50);
      rect(x,y,l,h);
      arc(x,c,h,h,radians(90),radians(270));
      arc(x+l,c,h,h,radians(-90),radians(90));
      if(mousePressed) {
        fill(255,100);
        rect(x,y,l,h);
        arc(x,c,h,h,radians(90),radians(270));
        arc(x+l,c,h,h,radians(-90),radians(90));
      }
    }
  }
  
  void pressAnim() {
    fill(255,i);
    if(trans) {
      i+=3;
      if(i >= 180)
        trans = false;
    }
    if(!trans) {
      i-=3;
      if(i <= 0)
        trans = true;
    }
    ellipse(x+i,y+h/2,50,50);
  }
}

class EndPage {

  int QRx, QRy, QRsize;
  boolean qrc1, qrc2;
  boolean aauc1, aauc2;
  boolean medc1, medc2;
  boolean ugc1, ugc2;
        
  EndPage(int qx, int qy, int qs) {
    QRx = qx;
    QRy = qy;
    QRsize = qs;
  }
  
  void update() {
    fill(0,0,255);
    text("> www.aau.dk",50,700);
    text("> www.aau.dk/uddannelser/bachelor/medialogi",50,730);
    text("> www.ug.dk",50,760);
    image(files.QRcode,QRx,QRy,QRsize,QRsize);
    qrc1 = mouseX < QRx+QRsize && mouseX > QRx;
    qrc2 = mouseY < QRy+QRsize && mouseY > QRy;
    aauc1 = mouseX < 227 && mouseX > 50;
    aauc2 = mouseY < 700 && mouseY > 685;
    medc1 = mouseX < 626 && mouseX > 50;
    medc2 = mouseY < 730 && mouseY > 715;
    ugc1 = mouseX < 213 && mouseX > 50;
    ugc2 = mouseY < 760 && mouseY > 745;
  }
  
  void press() {
    if(qrc1 && qrc2)
      link(files.links[1]);
    else if(aauc1 && aauc2)
      link(files.links[0]);
    else if(medc1 && medc2)
      link(files.links[1]);
    else if(ugc1 && ugc2)
      link(files.links[2]);
  }
}
