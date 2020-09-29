class Files {  
  String[] titles = {"MEDIALOGI","DET KREATIVE","DET TEKNISKE","SØG IND NU"};    //string array of the headlines for the pages
  String[] bodyTexts = { "",
                         "Hos Aalborg Universitet lægger vi vægt på\nkreativitet og at kunne tænke ud af boksen\nnår det kommer til vores projekt-orienteret\nuddannelse. Det er vigtigt at kunne give\nprojekterne sit eget personlige touch.\nEn måde at skille sig ud på er ved at tag\nopgaven i en utraditionel retning eller ved\nat forklare sit projekt ved at vise det\nkontra beskrive det, så prøv nedenunder\nat give din oplevelse dit eget personlige\ntouch.",
                         "Efter man har besluttet sig for en retning at\narbejde imod, så skal ideen eksekveres\ngennem, et hovedområde i Medialogy,\nprogrammering. Kodning og forståelsen af\nprocessen er en vigtig del af at kunne holde\noverblik når man har flere bolde i luften, det\ner derfor essentielt at man skriver noter til sin\nkode for at kunne finde rundt og huske\nhvilke strings gør så der ikke går kludder i\nkoden. For at holde koden simpel så prøv\nnedenunder at bevæge din figur fra\ntidligere rundt på skærmen.",
                         "Tak for at færdiggøre vores uddannelses-\nguide om Medialogi. Vi håber at den har\ngivet dig en god ide om hvad det er vi,\nblandt andet, arbejder med underuddan-\nnelsen. Forhåbentlig har det givet dig en god\nide om studiet er noget for dig, men hvis der\nstadig er tvivl så gå endelig ind på Aalborg\nUniversitets hjemmeside og læs mere om\nMedialogi eller nogle af deres andre uddan-\nnelser som du kunne have interesse for.\nMange tak og forhåbentlig på gensyn!"
                       };
  String[] links = { "https://www.aau.dk",
                     "https://www.aau.dk/uddannelser/bachelor/medialogi",
                     "https://ug.dk" };

  String[] jobTitles = { "Softwareudvikler",
                         "Interaktions-\ndesigner",
                         "It-rådgiver",
                         "Spiludvikler",
                         "Webudvikler",
                         "Projektleder" };

  String bgImgName = "bg.jpg";
  String btnImgName = "nextBtn01.png";
  String QRname = "QRcode01.png";
  String[] headFiles  = {"h0.png", "h1.png", "h2.png"};
  String[] torsoFiles = {"t0.png", "t1.png", "t2.png"};
  String[] legFiles   = {"l0.png", "l1.png", "l2.png"};
  
  PImage bgImg = new PImage();
  PImage btnImg = new PImage();
  PImage QRcode = new PImage();
  PImage[] heads = new PImage[headFiles.length];
  PImage[] torsos = new PImage[torsoFiles.length];
  PImage[] legs = new PImage[legFiles.length];
  
  void loadImages() {
    bgImg = loadImage(bgImgName);
    btnImg = loadImage(btnImgName);
    QRcode = loadImage(QRname);
    for(int i = 0; i < headFiles.length; i++) {
      heads[i] = loadImage(headFiles[i]);
      torsos[i] = loadImage(torsoFiles[i]);
      legs[i] = loadImage(legFiles[i]);
    }
  }
}
