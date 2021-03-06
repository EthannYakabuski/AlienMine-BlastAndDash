class Tile {
  
  String type;
  boolean traversable;
  int colour;
  int x_coor;
  int y_coor;
  int health = 100;
  int ironamount = 0; 
  int goldamount = 0;
  int woodamount = 0;
  int superPowerAmount = 0; 
  int potionUpgradeAmount = 0; 
  boolean clickable = true; 
  boolean hasPlayer = false; 
  PImage currentImage; 

  
  //its location in the 2D array
  int indexI; 
  int indexJ;
  
  //constructor \, blocks by default are dirt
  Tile() {
    type = "Dirt";
    traversable = true;
    clickable = false;
    colour = #3AAD55;
  }
  
  Tile(String typeOf, boolean traverse, int c) {
    type = typeOf;
    traversable = traverse;
    colour = c;
  }
  
  int getColour() {
    return colour;
  }
  
  String getType() {
    return type;  
  }
  
  int getHealth() {
    return health; 
  }
  
  void setColour(int c) {
    colour = c;
  }
  
  void setXCoor(int x) {
    x_coor = x;
  }
  
  void setYCoor(int y) {
    y_coor = y; 
  }
  
  void setIndexI(int i) {
    indexI = i;
  }
  
  void setIndexJ(int j) {
    indexJ = j; 
  }
  
 
  void clicked(Player player) {
    
    println("Player location: "); 
    println(player.xC);
    println(player.yC);
    
    
    //allowed to click a tile that is within 4 squares away in any direction
    
    /*
    
     x x x x x x x x x x x
     x x x x x x x x x x x   
     x a a a a a a a a a x
     x a a a a a a a a a x       shown here player 'Y' can mine all blocks labeled 'a'
     x a a a a a a a a a x       and only if the tile itself is actually clickable
     x a a a a Y a a a a x
     x a a a a a a a a a x
     x a a a a a a a a a x
     x a a a a a a a a a x
     x x x x x x x x x x x 
     x x x x x x x x x x x 
    */
    
    if(clickable) {
     
       println("Player X coor: " + player.xC); 
       println("Player Y coor: " + player.yC); 
       
       int playerI = (int)player.xC/20;
       int playerJ = (int)player.yC/20;
       
       //calculates how many columns away the player is from the block they are attempting to click
       int iDifference; 
       iDifference = abs(playerI - indexJ); 
       println("horizontally i am " + iDifference + " blocks away");
       
       //calculates how many rows away the player is from the block they are attempting to click
       int jDifference; 
       jDifference = abs(playerJ - indexI); 
       println("vertically i am " + jDifference + " blocks away");
       
       //if either of the differences amount to more then 2 blocks away, they cannot click that block
       //the player must also have the pickaxe selected
       if(iDifference <=4 && jDifference <=4 && player.active == 3) {
         health = health - 25; 
       
         //tiles that have already been mined are no longer clickable
         if(health == 0) {
           
           player.addGold(goldamount); 
           player.addIron(ironamount);
           player.addWood(woodamount);
           player.addPotionPiece(potionUpgradeAmount);
           player.addSuperPowerPiece(superPowerAmount);
           
           clickable = false;  
         }
       }
     
    }
    
    
  }
  
  
  void nothing() {
    type = "Nothing";
    traversable = true; 
    clickable = false; 
  }
  
  void dirt() {
    type = "Dirt";
    traversable = true;
    clickable = false;
    colour = #3AAD55;
  }
  
  void iron() {
    type = "Iron";
    traversable = true;
    clickable = true; 
    colour = #B2A89C;
    ironamount = 10;
    goldamount = 0; 
    superPowerAmount = 0; 
    potionUpgradeAmount = 0;
  }
  
  void gold() {
    type = "Gold";
    traversable = true;
    clickable = true;
    colour = #E6ED35;
    goldamount = 10;
    ironamount = 0; 
    superPowerAmount = 0; 
    potionUpgradeAmount = 0;
    
  }
  
  void water() {
    type = "Water";
    traversable = false;
    clickable = false;
    colour = #2736CB;
  }
  
  void lava() {
    type = "Lava";
    traversable = true;
    clickable = false;
    colour = #D33A3A;
  }
  
  void tree() {
    type = "Tree";
    traversable = true;
    clickable = true; 
    colour = #397619;
    woodamount = 10;
    goldamount = 0;
    ironamount = 0;
    superPowerAmount = 0; 
    potionUpgradeAmount = 0;
  }
  
  void steel() {
    type = "Steel"; 
    traversable = true; 
    clickable = false; 
    
    
  }
  
  void superPower() {
    type = "SuperPower"; 
    traversable = true; 
    clickable = true; 
    superPowerAmount = 1; 
    woodamount = 0;
    goldamount = 0;
    ironamount = 0;
    
    
  }
  
  void potionUpgrade() {
    type = "PotionUpgrade";
    traversable = true; 
    clickable = true; 
    potionUpgradeAmount = 1;
    woodamount = 0;
    goldamount = 0;
    ironamount = 0;
  }
  
 void showYourself() {
    colour = #000000;
 }
 
 
 void tropical() {
    type = "Tropical";
    traversable = true;
    clickable = false; 
   
   
 }
 
 
 void sand() {
   type = "Sand"; 
   traversable = true; 
   clickable = false; 
   
   
 }
 
 
 void tropicalTree() {
   
   
 }
 

  
}
