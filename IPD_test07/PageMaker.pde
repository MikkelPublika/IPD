//> class for creating other objects
class PageMaker {
  int numOfPages = 4;
  int currentPage = 0;    //change this (0-3) to begin on the desired page

  //> objects of type 'Page array', 'Button' and 'Tech' are made
  Page[] pages = new Page[numOfPages];    //an array (list) with name 'pages' and length 'numOfPages' containing the pages is made
  Button btn = new Button(620, 920, 75, 75);    //the continue button with name 'btn' is created with arguments for position and size
  Tech tech;    //the technical interactive with name 'tech' is made

  //> custom function for initialization (init) code
  void init() {
    noStroke();
    for (int i = 0; i < pages.length; i++) {    //the Page array is filled with pages
      switch(i) {
        case 2:
          pages[i] = new Page(width/2, height*.1, files.titles[i], 50, 150, files.bodyTexts[i]);
          ac = new AvatarCreator(width/2,700);
          ac.init();
          tech = new Tech(ac.myAvatar);
        default:
          pages[i] = new Page(width/2, height*.1, files.titles[i], 50, 150, files.bodyTexts[i]);
      }
    }
  }

  //> custom function for continuous code
  void update() {
    image(files.bgImg,0,0,width,height);    //bg image is drawn
    
    if(currentPage == 0)
      image(m,0,150,707,1000);
    pages[currentPage].update();    //the update function from the current page is run
    
    if(currentPage == 2)
      tech.update();    //if the current page is the 3rd, the update function from 'tech' is run
    btn.update();    //update function for the button
    
    if(ac != null)
      ac.update();
  }

  //> code that are to be run whenever the button (btn) is pressed
  void press() {
    if (ac != null){
      ac.press();
    }
    
    if (btn.cx && btn.cy)    //checks if mouse is hovering over the button
      currentPage++;    //if so, the next page will load
    if (currentPage >= pages.length)    //if beyond the length of the array of pages, we go back to the beginning of the array
      currentPage = 0;
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
    textAlign(CENTER);    //title (headline) is drawn
    fill(255);
    titleFont = createFont("Verdana",64);
    textFont(titleFont);
    text(titleText, titleX, titleY);

    textAlign(LEFT);    //body text is drawn
    fill(255);
    bodyFont = createFont("Verdana",24);
    textFont(bodyFont);
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

    cx = mouseX > startX && mouseX < startX+sizeX;    //conditions for checking whether the mouse hovers the button, are set
    cy = mouseY > startY && mouseY < startY+sizeY;

    if (cx && cy)    //if conditions are met, (the color of the button changes, and) the 'hover' bool (boolean) is set to true
      hover = true;
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
  boolean hover = false;    //by default, the mouse will not be hovering over the interactable, so this is set to false
  
  Avatar myAvatar;
  
  Tech(Avatar avatar) {
    myAvatar = avatar;
  }

  void update() {
    speedString = nf(speed,0,1);
    code = "int speed = " + speedString;
    textAlign(CENTER,TOP);
    text(code,width/2,y);
    textAlign(LEFT);
    
    myAvatar.speed = speed;
    
    speed = constrain(speed, -5,5);
    if(speed < 0 && speed > -.1 || speed > 0 && speed < .1)
      speed = 0;
    
    c1 = mouseX <= x+l && mouseX >= x;    //conditions for checking whether the mouse hovers the interactable code, are set
    c2 = mouseY <= y+h && mouseY >= y;
    //the interactable is hovered over
    if(c1 && c2) {
      fill(255,100);
      rect(x,y,l,h);
      arc(x,c,h,h,radians(90),radians(270));
      arc(x+l,c,h,h,radians(-90),radians(90));
    }
  }
  
  void drag() {
    if(c2)
      speed += (mouseX - pmouseX) * .1;
  }
}
