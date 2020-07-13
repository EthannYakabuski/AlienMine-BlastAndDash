class HiveMaster extends Enemy {
  
   PImage[] images = new PImage[3];
  
  //100 health
  //20 attack
  
  
  //for testing spawns a Phalax (0,0)
  HiveMaster() {
    super(10000, 8, 0, 0, 0, 0, "HiveMaster", 250);
    
    images[0] = loadImage("hiveMaster.png");
    
    
    images[0].resize(100,100);
  }
  
  
  //for when the location is specified
  HiveMaster(float x, float y) {
    super(10000, 8, x, y, x/20, y/20, "HiveMaster", 250);
    
    images[0] = loadImage("hiveMaster.png");
    
    
    images[0].resize(100,100);
  }
  
  void show() {
    
    image(images[0], this.xC, this.yC);
    
  }
  
  void transport() {
    
    
    
    
  }
  
  
  //issue: incoming targetX, targetY is in index, not graphics amount
  void move(int targetX, int targetY) {
      
      //make targetX and targetY into the graphics coordinate not index
      targetX = targetX*20; 
      targetY = targetY*20;
    
      //accidentaly switched them somewhere along the line
      int temp = targetY; 
      targetY = targetX; 
      targetX = temp;
      
      
      int myLocX = (int)this.xC; 
      int myLocY = (int)this.yC;
      
      /* 1
        xxxxxxxxxxx
        xxxMxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxTxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        */
        if( (targetX > myLocX)&(targetY > myLocY) ) {
        
          //System.out.println("TOOK A STEP FOR REAL 1"); 
          
          int xDifference = (int)(targetX - myLocX)/20;
          int yDifference = (int)(targetY - myLocY)/20;
          
          if(xDifference < 0) {
            xDifference = xDifference*-1; 
          }
          
          if(yDifference < 0) {
            yDifference = yDifference*-1; 
          }
          
          int totalDifference = xDifference + yDifference; 
          
          
          if(totalDifference > 15) {
            this.needToShoot = true;
            
          } else {
            
            transport();
            
          }
     
          
     
        /* 2
        xxxxxxxxxxx
        xxxxxxxxxTx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxMxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        */
        } else if ( (targetX > myLocX)&(targetY<myLocY) ) {
        
          //System.out.println("TOOK A STEP FOR REAL 2"); 
          int xDifference = (int)(targetX - myLocX)/20;
          int yDifference = (int)(targetY - myLocY)/20;
          
          if(xDifference < 0) {
            xDifference = xDifference*-1; 
          }
          
          if(yDifference < 0) {
            yDifference = yDifference*-1; 
          }
          
          int totalDifference = xDifference + yDifference; 
          
          
          if(totalDifference > 15) {
            this.needToShoot = true;
            
          } else {
            
            transport();
            
          }
          
         
        
        /* 3
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxTxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxMxx
        xxxxxxxxxxx
        */
        } else if ( (targetX < myLocX)&(targetY < myLocY) ) {
        
          //System.out.println("TOOK A STEP FOR REAL 3"); 
          
          
          int xDifference = (int)(targetX - myLocX)/20;
          int yDifference = (int)(targetY - myLocY)/20;
          
          if(xDifference < 0) {
            xDifference = xDifference*-1; 
          }
          
          if(yDifference < 0) {
            yDifference = yDifference*-1; 
          }
          
          int totalDifference = xDifference + yDifference; 
          
          
          if(totalDifference > 15) {
            this.needToShoot = true;
            
          } else {
            
            transport();
            
          }
          
          
        
        /* 4
        xxxxxxxxxxx
        xxxxxxxxMxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxTxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        */
      } else if ( (targetX < myLocX)&(targetY > myLocY) ) {
        
        //System.out.println("TOOK A STEP FOR REAL 4"); 
        
         int xDifference = (int)(targetX - myLocX)/20;
         int yDifference = (int)(targetY - myLocY)/20;
         
         if(xDifference < 0) {
            xDifference = xDifference*-1; 
          }
          
          if(yDifference < 0) {
            yDifference = yDifference*-1; 
          }
          
         int totalDifference = xDifference + yDifference; 
         
         
         if(totalDifference > 15) {
            this.needToShoot = true;
            
          } else {
            
            transport();
            
          }
          

        

        /* 5
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxMxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxTxxxxxxx
        xxxxxxxxxxx
        */
      } else if ( (targetX == myLocX)&(targetY > myLocY) ) {
        
         int xDifference = (int)(targetX - myLocX)/20;
         int yDifference = (int)(targetY - myLocY)/20;
         
         if(xDifference < 0) {
            xDifference = xDifference*-1; 
          }
          
          if(yDifference < 0) {
            yDifference = yDifference*-1; 
          }
          
         int totalDifference = xDifference + yDifference; 
         
         
         
        if(totalDifference > 15) {
            this.needToShoot = true;
            
          } else {
            
            transport();
            
          }
        
        
        /* 6
        xxxxxxxxxxx
        xxxTxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxMxxxxxxx
        xxxxxxxxxxx
        */
      } else if ( (targetX == myLocX)&(targetY < myLocY) ) {
        
        int xDifference = (int)(targetX - myLocX)/20;
         int yDifference = (int)(targetY - myLocY)/20;
         
         if(xDifference < 0) {
            xDifference = xDifference*-1; 
          }
          
          if(yDifference < 0) {
            yDifference = yDifference*-1; 
          }
          
         int totalDifference = xDifference + yDifference; 
         
         if(totalDifference > 15) {
            this.needToShoot = true;
            
          } else {
            
            transport();
            
          }
         
        
        /* 7
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxMxxxxxTxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        */
      } else if ( (targetX > myLocX)&(targetY == myLocY) ) {
        
        int xDifference = (int)(targetX - myLocX)/20;
         int yDifference = (int)(targetY - myLocY)/20;
         
         if(xDifference < 0) {
            xDifference = xDifference*-1; 
          }
          
          if(yDifference < 0) {
            yDifference = yDifference*-1; 
          }
          
         int totalDifference = xDifference + yDifference; 
        
         
         if(totalDifference > 15) {
            this.needToShoot = true;
            
          } else {
            
            transport();
            
          }
          
        
        /* 8
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxTxxxxxMxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        xxxxxxxxxxx
        */
      } else if ( (targetX < myLocX)&(targetY == myLocY) ) {
        
         int xDifference = (int)(targetX - myLocX)/20;
         int yDifference = (int)(targetY - myLocY)/20;
         
         if(xDifference < 0) {
            xDifference = xDifference*-1; 
          }
          
          if(yDifference < 0) {
            yDifference = yDifference*-1; 
          }
          
         int totalDifference = xDifference + yDifference; 
         
         if(totalDifference > 15) {
            this.needToShoot = true;
            
          } else {
            
            transport();
            
          }
          
       
        
        
      }
      
     
    }
    
}
