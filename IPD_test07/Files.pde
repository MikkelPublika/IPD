class Files {  
  String[] titles = {"MEDIALOGI","DET KREATIVE","DET TEKNISKE","SØG IND NU"};    //string array of the headlines for the pages
  String[] bodyTexts = { "",
                         "Hos Aalborg Universitet lægger vi vægt på\nkreativitet og at kunne tænke ud af boksen\nnår det kommer til vores projekt-orienteret\nuddannelse. Det er vigtigt at kunne give\nprojekterne sit eget personlige touch.\nEn måde at skille sig ud på er ved at tag\nopgaven i en utraditionel retning eller ved\nat forklare sit projekt ved at vise det\nkontra beskrive det, så prøv nedenunder\nat give din oplevelse dit eget personlige\ntouch.",
                         "Efter man har besluttet sig for en retning at arbejde\nimod, så skal ideen eksekveres gennem, et\nhovedområde i Medialogy, programmering.\nKodning og forståelsen af processen er en vigtig del af at\nkunne holde overblik når man har flere bolde i luften, det\ner derfor essentielt at man skriver noter til sin kode for\nat kunne finde rundt og huske hvilke strings gør så der\nikke går kludder i koden. For at holde koden simpel så\nprøv nedenunder at bevæge din figur fra tidligere rundt\npå skærmen.",
                         "Tak for at færdiggøre vores uddannelsesguide om\nMedialogi. Vi håber at den har givet dig en god ide om\nhvad det er vi, blandt andet, arbejder med under\nuddannelsen. Forhåbentlig har det givet dig en god ide\nom studiet er noget for dig, men hvis der stadig er tvivl\nså gå endelig ind på Aalborg Universitets hjemmeside og\nlæs mere om Medialogi eller nogle af deres andre\nuddannelser som du kunne have interesse for.\nMange tak og forhåbentlig på gensyn!"
                       };
                       
  String bgImgName = "P0_bg01.jpg";
  String btnImgName = "nextBtn01.png";
  String[] headFiles  = {"h0.png", "h1.png", "h2.png"};
  String[] torsoFiles = {"t0.png", "t1.png", "t2.png"};
  String[] legFiles   = {"l0.png", "l1.png", "l2.png"};
  
  PImage bgImg = new PImage();
  PImage btnImg = new PImage();
  PImage[] heads = new PImage[headFiles.length];
  PImage[] torsos = new PImage[torsoFiles.length];
  PImage[] legs = new PImage[legFiles.length];
  
  void loadImages() {
    bgImg = loadImage(bgImgName);
    btnImg = loadImage(btnImgName);
    
    for(int i = 0; i < headFiles.length; i++) {
      heads[i] = loadImage(headFiles[i]);
      torsos[i] = loadImage(torsoFiles[i]);
      legs[i] = loadImage(legFiles[i]);
    }
  }
}
