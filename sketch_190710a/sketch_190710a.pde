import processing.sound.*;
import java.util.Arrays;

Player playerone = new Player();
GameBoard board = new GameBoard();

PImage[] images = new PImage[100];

int width = 1400;
int height = 900;


int playersHighScore = 0;

int frameRule; 

boolean restartAvailable = false;

boolean potionSickness = false;
int potionTimer = 0;

boolean superSickness = false; 
int superTimer = 0; 

//boolean shotGunSickness = false;
int shotGunTimer = 0;

boolean titleScreen = true;


boolean showingScores = false;

void setup() {
  
  
  
  //setting the framerate
  frameRate(30);
  
  frameRule = -1;
  
 
  
  
  //tiles
  images[0] = loadImage("tree100.PNG");
  images[1] = loadImage("tree75.PNG");
  images[2] = loadImage("tree50.PNG");
  images[3] = loadImage("tree25.PNG");
  
  images[4] = loadImage("iron100.PNG");
  images[5] = loadImage("iron75.PNG");
  images[6] = loadImage("iron50.PNG");
  images[7] = loadImage("iron25.PNG");
  
  images[8] = loadImage("gold100.PNG");
  images[9] = loadImage("gold75.PNG");
  images[10] = loadImage("gold50.PNG");
  images[11] = loadImage("gold25.PNG");
  
  images[12] = loadImage("lava100.PNG");
  images[13] = loadImage("grass100.PNG");
  images[14] = loadImage("dirt100.PNG");
  
  
  //characters
  //players
  images[15] = loadImage("lenny100.PNG");
  
  //enemies
  //ants
  images[16] = loadImage("ant100.PNG");
  images[17] = loadImage("ant75.PNG"); 
  images[18] = loadImage("ant50.PNG");
  
  //flowers
  images[19] = loadImage("flower100.PNG"); 
  images[20] = loadImage("flower75.PNG");
  images[21] = loadImage("flower50.PNG");
  
  //robots
  images[22] = loadImage("robot100.PNG"); 
  images[23] = loadImage("robot75.PNG");
  images[24] = loadImage("robot50.PNG");
  
  
  //images for the hud
  images[25] = loadImage("potion.JPG");
  images[26] = loadImage("pickaxe.JPG");
  images[27] = loadImage("woodTommy.JPG");
  images[28] = loadImage("ironTommy.JPG");
  images[29] = loadImage("goldTommy.JPG");
  images[30] = loadImage("woodShotty.JPG");
  images[31] = loadImage("ironShotty.JPG");
  images[32] = loadImage("goldShotty.JPG");
  
  
  
  //images for phalax
  images[33] = loadImage("phalax.png");
  
  
  
  //images for the steel biome
  images[34] = loadImage("steel.JPG"); 
  images[35] = loadImage("steelPotionUpgrade.JPG"); 
  images[36] = loadImage("steelSuperPower.JPG"); 
  
  //images for the base enemies unique to the steel biome
  images[37] = loadImage("electroMan.JPG"); 
  images[38] = loadImage("electroDuo.JPG"); 
  images[39] = loadImage("electroQuad.png");
  
  
  //more images for the hud
  images[40] = loadImage("superPower.JPG");
  
  
  
  images[43] = loadImage("tropical.JPG");
  
  images[44] = loadImage("water.JPG");
  images[46] = loadImage("sand.JPG");
  
  
  //enemies for the tropical biome
  images[47] = loadImage("monkey.JPG");
  images[48] = loadImage("gorilla.JPG");
  
  images[47].resize(20,20);
  images[48].resize(40,40);
  
  
  images[0].resize(20,20);
  images[1].resize(20,20);
  images[2].resize(20,20);
  images[3].resize(20,20);
  images[4].resize(20,20);
  images[5].resize(20,20);
  images[6].resize(20,20);
  images[7].resize(20,20);
  images[8].resize(20,20);
  images[9].resize(20,20);
  images[10].resize(20,20);
  images[11].resize(20,20);
  images[12].resize(20,20);
  images[13].resize(20,20);
  images[14].resize(20,20);
  images[15].resize(40,40);
  images[16].resize(20,20);
  images[17].resize(20,20);
  images[18].resize(20,20);
  images[19].resize(20,20);
  images[20].resize(20,20);
  images[21].resize(20,20);
  images[22].resize(20,20);
  images[23].resize(20,20);
  images[24].resize(20,20);
  
  
  images[25].resize(68,68);
  images[26].resize(68,68);
  images[27].resize(75,35);
  images[28].resize(75,35);
  images[29].resize(75,35);
  
  images[30].resize(75,35);
  images[31].resize(75,35);
  images[32].resize(75,35);
  
  
  images[33].resize(100,100);
  
  
  //images for the steel biome
  images[34].resize(20,20); 
  images[35].resize(20,20); 
  images[36].resize(20,20);
  
  images[37].resize(20,20);
  images[38].resize(40,40); 
  images[39].resize(40,40);
  
  images[40].resize(68,68);
  
  
  images[43].resize(20,20);
  images[44].resize(20,20);
  images[46].resize(20,20);
  
  
  images[45] = loadImage("pirateShip.png");
  images[45].resize(250,100);
  
  
  //bullets
  images[41] = loadImage("flowerBullet.png");
  images[41].resize(20,20);
  
  images[42] = loadImage("hiveBullet.png");
  images[42].resize(40,40);
  
  
  images[49] = loadImage("cannonBall.png");
  images[49].resize(40,40);
  
  
  
  
  board.imageList = images;
  board.addPlayer(playerone);
  board.createMap();
  size(1400,900);
  smooth();
  
 

}


void draw() {
  
  
  //main menu options for the game
  
  
  if(showingScores) {
    
    //show the scores
    String[] lines = loadStrings("highScores.txt");
    
    for(int i = 0; i < lines.length; i++) {
      
      fill(155); 
      textSize(30);
      text(lines[i], 100, 100*(i+1));
      textSize(11);
    }
    
  }
  
  
  
  //basic layout
  background(255);
  
  
  if(titleScreen) { noLoop(); }
  
  gridDisplay();
  
  
  //variable keeping track of the current frame
  frameRule = frameRule +1; 
  
  //System.out.println("frameRule: " + frameRule); 
  
  
  //shows game graphics and other
  //important information for the player concerning the game state
  board.hud(playerone);
  board.display();
  board.spawnInitialEnemies();
  board.checkAnimations();
  
  //updates enemies
  board.checkEnemies();
  
  board.checkBiomeSwitch();
  
  //before you move the enemies apply swarm intelligence
  board.updateSwarmIntelligence(); 
  
  
  board.checkPirateSickness();
  //move all the enemies
  board.moveEnemies(frameRule%30);
  board.spawnAnEnemy(frameRule%30);
  board.showEnemies();
  
  
  //updates player bullets
  board.grantShottyAmmo(frameRule%150);
  //board.checkBulletRedundancy();
  board.drawBullets();
  board.checkCollisions();
  
  //updating damage to the player
  //environmental damage
  board.checkLavaDamage();
  
  //enemy damage
  board.checkEnemyAntsEating();
  board.checkEnemiesWhoShoot();
  
  board.drawFlowerBullets();
  board.checkFlowerBulletCollisions();
  
  board.drawRobotBullets();
  board.checkRobotBulletCollisions();
  
  
  board.drawHiveBullets();
  board.checkHiveBulletCollisions();
  
  
  board.drawCannonBullets();
  board.checkCannonBulletCollisions();
  
  //clearing of bullets in backing array that are now off screen and no longer active
  board.checkBulletRedundancy();
  
  
  
  //board.drawPhalaxBullets();
  //board.checkPhalaxBulletCollisions();
  
  
  //ANIMATIONS
  
  //handles potion cooldown animation
  if(potionSickness) {
     potionTimer = potionTimer + 1; 
     
     //animate the potion box
     board.addPotionAnimateTick(potionTimer);
       
     //can only drink a potion every 8 seconds
     if(potionTimer == 240) {
       
       potionTimer = 0; 
       potionSickness = false;
     } 
  }
  
  
  //handles super power cooldown animation
  if(superSickness) {
     superTimer = superTimer + 1; 
     
     //animate the super power box
     board.addSuperPowerAnimateTick(superTimer);
       
     //can only use super power every 24 seconds
     if(superTimer == 720) {
       
       superTimer = 0; 
       superSickness = false;
     } 
  }
  

  //handles if the game has ended
  boolean playerDead = board.endGame();
  //if the player has died end the game
  if(playerDead) {
    noLoop();
    showRestartButton();
  }
  
  
  
  if(titleScreen) { makeIntroScreen(); }
  
}

void makeIntroScreen() {
  //noLoop();
  
  color(255);
  fill(000);
  rect(0,0,2800,1800);
  
  
  makePlayButton();
  
  makeLeaderBoardButton();
  
  showScores();
  
  makeCharacterCustomizationButton();
  
  
  
}

void makePlayButton() {
  
  fill(255); 
  
  rect(700,300,250,100);
  fill(000);
  textSize(20);
  text("PLAY : NORMAL MODE", 590, 300);
  textSize(11);
  
}

void makeCharacterCustomizationButton() {
  
  
}


void makeLeaderBoardButton() {
  
  fill(255);
  
  rect(700,450,250,100);
  fill(000);
  textSize(20);
  text("LEADERBOARD", 620, 450);
  textSize(11);
  
}

void showRestartButton() {
  restartAvailable = true;
  
  fill(0); 
  rect(0,0,400,400);
  fill(255);
  text("RESTART",80,100);
  
}

void gridDisplay() {
  
  //vertical lines
  int i = 0;
  while (i < 1400) {
    line(i,0,i,800);
    i = i + 20;
  }
  //horizontal lines
  int j = 0;
  while (j < 801) {
    line(0,j,1400,j);
    j = j + 20;
  }
}

void keyPressed() {
       
  //handles WASD movement and hotkey bar START
  if (key == 119) {
    playerone.keyHandler("w");
    
  } else if (key == 97) {
    playerone.keyHandler("a");
    
  } else if (key == 115) {
    playerone.keyHandler("s");
    
  } else if (key == 100) {
    playerone.keyHandler("d");
    
  } else if (key == 49) {
    playerone.keyHandler("1"); 
    
  } else if (key == 50) {
    playerone.keyHandler("2"); 
  } 
  else if (key == 51) {
    playerone.keyHandler("3"); 
  }
  else if (key == 52) {
    
    
    if(!superSickness) {
      superSickness = true;
      playerone.keyHandler("4");
      board.superPowerApplied();
      
    }
    
  }
  else if (key == 53) {
    
    if(!potionSickness) {
      
      potionSickness = true;
      playerone.keyHandler("5");
      
    }
    
  } else if (key == 101) {
    playerone.keyHandler("e"); 
  } else if (key == 114) {
    playerone.keyHandler("r"); 
  } else if (key == 116) {
    playerone.keyHandler("t"); 
  } else if (key == 102) {
    playerone.keyHandler("f"); 
  } else if (key == 103) {
    playerone.keyHandler("g"); 
  } else if (key == 104) {
    playerone.keyHandler("h"); 
  } else if (key == 99) {
    playerone.keyHandler("c"); 
  } else if (key == 118) {
    playerone.keyHandler("v"); 
  } else if (key == 98) {
    playerone.keyHandler("b"); 
  }
  //handles WASD movement and hotkey bar END
  
}

void showScores() {
  System.out.println("Showing scores");
  
  showingScores = true;
  
  
  String[] lines = loadStrings("highScores.txt");
  
  for(int i = 0; i < lines.length; i++) {
     System.out.println(lines[i]);
  }
  
  //show the scores
    //String[] lines = loadStrings("highScores.txt");
    fill(155);
    textSize(30);
    text("Last 10 games score", 100,50);
    
    textSize(11);
    
    for(int i = 0; i < lines.length; i++) {
      
      fill(155); 
      textSize(30);
      text(lines[i], 100, 75+(75*(i+1)));
      textSize(11);
    }
    
 // loop();


}

void mouseDragged() {
  
 // println(mouseX);
 // println(mouseY);
  
  int x = (mouseX/20);
  int y = (mouseY/20);
  
  
  //if the game is in a game over state
  if(restartAvailable) {
    
    if( (mouseX >= 0) & (mouseX <= 400) ) {
      
      if( (mouseY >=0) & (mouseY <= 400) ) {
        
        
       //save the players score
        String[] lines = loadStrings("highScores.txt");
        
        System.out.println("lines.length"+lines.length);
        
        String[] newData;
        
        
        if(lines.length>=10) {
          newData = new String[10];
          newData[0] = String.valueOf(playerone.score);
        } else {
          newData = new String[lines.length+1];
          newData[0] = String.valueOf(playerone.score);
        }
        
        for(int i = 0; i < lines.length; i++) {
          
          newData[i+1] = lines[i];
          
        }
       
        
       
        
        saveStrings("data/highScores.txt",newData);
        
        
        
        restartAvailable = false;
        board.resetBoardVariables();
        board.pseudoConstructor();
        
        
        restartAvailable = false;

        potionSickness = false;
        potionTimer = 0;

        superSickness = false; 
        superTimer = 0; 

        //boolean shotGunSickness = false;
        shotGunTimer = 0;

        titleScreen = true;
        
        setup();
        loop();
      }
      
    }
    
  }
  
  
  
  //if the game is on the title screen
  if(titleScreen) {
    
    
    if(  (mouseX >= 575) & (mouseX <= 825) ) {
      
      if(  (mouseY >= 250) & (mouseY <= 350) ) {
        
        //the player is clicking the story mode button
        titleScreen = false;
        loop();
        
        
      }
      
      
      
    }
    
    
    
    if(  (mouseX >= 575) & (mouseX <= 825) ) {
      
      if(  (mouseY >= 400) & (mouseY <= 500) ) {
        
        //the player is clicking the story mode button
        titleScreen = true;
        showingScores = true;
       // loop();
        showScores();
       // loop();
        
      }
      
      
      
    }
    
    
    
  }
  
  
  
  //proves the clicking is on the correct square
  /*
  if(x < 70 && y < 40) {
    board.tiles[y][x].showYourself();
    println("I: " + y);
    println("J: " + x);
  }
  */
  //SHOOTING
  //if the player is clicking in the board and the tommy gun is active
  if( (x < 70) & (y < 40) & (playerone.active == 1)) {
    //println(playerone.getXC());
   // println(playerone.getYC());
   // println("bullet");
    if(!board.tommyGunSickness) {
      board.introduceBullet(x,y, playerone.getYC(), playerone.getXC(), playerone.getTommy(), false, false);  
    }
  }
  
  //if the player is click in the board and the shotgun is active
  if( (x < 70) & (y < 40) & (playerone.active == 2)) {
    
    if(!board.shotGunSickness) {
      board.introduceBullet(x,y, playerone.getYC(), playerone.getXC(), playerone.getShotty(), true, false);
    } 
    
  }
  
  
  
  //if the player is clicking in the board and the pickaxe is active
  if(x < 70 && y < 40 && playerone.active == 3) {
    board.tiles[y][x].clicked(playerone);
  }

 
  
  
}



void mousePressed() {
  
 // println(mouseX);
  //println(mouseY);
  
  int x = (mouseX/20);
  int y = (mouseY/20);
  
  
  //if the game is in a game over state
  if(restartAvailable) {
    
    if( (mouseX >= 0) & (mouseX <= 400) ) {
      
      if( (mouseY >=0) & (mouseY <= 400) ) {
        
        
        
        //save the players score
        String[] lines = loadStrings("highScores.txt");
        
        System.out.println("lines.length"+lines.length);
        
        String[] newData;
        
        
        if(lines.length>=10) {
          newData = new String[10];
          newData[0] = String.valueOf(playerone.score);
        } else {
          newData = new String[lines.length+1];
          newData[0] = String.valueOf(playerone.score);
        }
        
        for(int i = 0; i < lines.length; i++) {
          
          newData[i+1] = lines[i];
          
        }
       
        
       
        
        saveStrings("data/highScores.txt",newData);
        
        
        
        restartAvailable = false;
        board.resetBoardVariables();
        board.pseudoConstructor();
        
        
        restartAvailable = false;

        potionSickness = false;
        potionTimer = 0;

        superSickness = false; 
        superTimer = 0; 

        //boolean shotGunSickness = false;
        shotGunTimer = 0;

        titleScreen = true;
        
        //GameBoard tempBoard = new GameBoard();
       // board = tempBoard;
        setup();
        loop();
      }
      
    }
    
  }
  
  
  
  //if the game is on the title screen
  if(titleScreen) {
    
    
    if(  (mouseX >= 575) & (mouseX <= 825) ) {
      
      if(  (mouseY >= 250) & (mouseY <= 350) ) {
        
        //the player is clicking the story mode button
        titleScreen = false;
        loop();
        
        
      }
      
      
      
    }
    
    if(  (mouseX >= 575) & (mouseX <= 825) ) {
      
      if(  (mouseY >= 400) & (mouseY <= 500) ) {
        
        //the player is clicking the story mode button
        titleScreen = true;
        showingScores = true;
        //loop();
        showScores();
        //loop();
        
      }
      
      
      
    }
    
    
    
  }
  
  //proves the clicking is on the correct square
  /*
  if(x < 70 && y < 40) {
    board.tiles[y][x].showYourself();
    println("I: " + y);
    println("J: " + x);
  }
  */
  //SHOOTING
  //if the player is clicking in the board and the tommy gun is active
  if(x < 70 && y < 40 && playerone.active == 1) {
    //println(playerone.getXC());
    //println(playerone.getYC());
    //println("bullet");
    if(!board.tommyGunSickness) {
      board.introduceBullet(x,y, playerone.getYC(), playerone.getXC(), playerone.getTommy(), false, false); 
    }
  }
  
  //if the player is click in the board and the shotgun is active
  if(x < 70 && y < 40 && playerone.active == 2) {
    
    if(!board.shotGunSickness) {
      board.introduceBullet(x,y, playerone.getYC(), playerone.getXC(), playerone.getShotty(), true, false);
    } 
    
  }
  
  
  
  //if the player is clicking in the board and the pickaxe is active
  if(x < 70 && y < 40 && playerone.active == 3) {
    board.tiles[y][x].clicked(playerone);
  }

  //this section holds the code to handle the user clicks in the HUD area
  if(mouseY > 800) {
    System.out.println("The user has clicked the HUD area"); 
    
    
    //handles armor upgrade choices
    if(mouseY >= 810 && mouseY <= 830) {
      System.out.println("Armor upgrade chosen"); 
      
      //handles which tier of armor upgrade was chosen
      if(mouseX >= 1135 && mouseX <= 1185) {
        System.out.println("Wood armor"); 
        playerone.applyArmor(1); 
      } else if (mouseX >= 1195 && mouseX <= 1245) {
        System.out.println("Iron armor"); 
        playerone.applyArmor(2); 
      } else if (mouseX >= 1255 && mouseX <= 1305) {
        System.out.println("Gold armor");  
        playerone.applyArmor(3);
      }
      
    //handles tommy gun upgrades  
    } else if (mouseY >= 840 && mouseY <=860) {
      System.out.println("Tommy Gun upgrade chosen"); 
      
      //handles which tier of tommy upgrade was chosen
      if(mouseX >= 1135 && mouseX <= 1185) {
        System.out.println("Wood Tommy"); 
      } else if (mouseX >= 1195 && mouseX <= 1245) {
        System.out.println("Iron Tommy"); 
        board.giveWeapon("Iron Tommy"); 
      } else if (mouseX >= 1255 && mouseX <= 1305) {
        System.out.println("Gold Tommy");  
        board.giveWeapon("Gold Tommy");
      }
      
      
    //handles shotgun upgrades
    } else if (mouseY >= 870 && mouseY <= 890) {
      System.out.println("Shotgun upgrade chosen"); 
      
      
      //handles which tier of shotgun upgrade was chosen
      if(mouseX >= 1135 && mouseX <= 1185) {
        System.out.println("Wood Shotgun"); 
      } else if (mouseX >= 1195 && mouseX <= 1245) {
        System.out.println("Iron Shotgun");
        board.giveWeapon("Iron Shotgun");
      } else if (mouseX >= 1255 && mouseX <= 1305) {
        System.out.println("Gold Shotgun");  
        board.giveWeapon("Gold Shotgun");
      }
    }
    
  }
  
}
