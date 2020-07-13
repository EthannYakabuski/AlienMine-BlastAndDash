class Robot extends Enemy {
  
  PImage[] images = new PImage[3];
  
  
  //100 health
  //20 attack
  
  
  //for testing spawns a flower (0,0)
  Robot() {
    super(150, 3, 0, 0, 0, 0, "Robot", 25);
    
    images[0] = loadImage("robot100.PNG"); 
    images[1] = loadImage("robot75.PNG");
    images[2] = loadImage("robot50.PNG");
    
    images[0].resize(20,20);
    images[1].resize(20,20);
    images[2].resize(20,20);
  }
  
  
  //for when the location is specified
  Robot(float x, float y) {
    super(150, 3, x, y, x/20, y/20, "Robot", 25);
    
    images[0] = loadImage("robot100.PNG"); 
    images[1] = loadImage("robot75.PNG");
    images[2] = loadImage("robot50.PNG");
    
    images[0].resize(20,20);
    images[1].resize(20,20);
    images[2].resize(20,20);
  }
  
  
  void show() {
    
     if(this.health > 75) {
        image(images[0], this.xC, this.yC);
      } else if ( (this.health <= 75) & (this.health > 50)) {
        image(images[1], this.xC, this.yC);  
      } else if(this.health <= 50 & (this.health > 0)) {
        image(images[2], this.xC, this.yC);
      } else if(this.health <= 0) {
        this.die();
      }
    
    
  }
  
  
  void move(int targetX, int targetY) {
    
   // System.out.println("Robot MOVING");
    
     //make targetX and targetY into the graphics coordinate not index
    targetX = targetX*20; 
    targetY = targetY*20;
    
    //accidentaly switched them somewhere along the line
    int temp = targetY; 
    targetY = targetX; 
    targetX = temp;
      
      
      int myLocX = (int)this.xC; 
        int myLocY = (int)this.yC;
        
        //System.out.println("MyLocX: " + myLocX); 
        //System.out.println("MyLocY: " + myLocY); 
        //System.out.println("TargetX: " + targetX); 
        //System.out.println("TargetY: " + targetY);
        
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
          
          //if the target is somewhat far away, move towards them
          if(totalDifference >=  10) {
          
             this.xC = this.xC+20; 
             this.yC = this.yC+20;
        
             this.indexI = this.indexI+1; 
             this.indexJ = this.indexJ+1;
            
          //if the target is close, take shots   
          } else {
            
            this.needToShoot = true;
            
            
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
          
          //if the target is somewhat far away, move towards them
          if(totalDifference >=  10) {
          
            this.xC = this.xC+20; 
            this.yC = this.yC-20;
        
            this.indexI = this.indexI+1; 
            this.indexJ = this.indexJ-1; 
            
          //if the target is close, take shots   
          } else {
            
            this.needToShoot = true;
            
            
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
          
          //if the target is somewhat far away, move towards them
          if(totalDifference >=  10) {
          
            this.xC = this.xC-20; 
            this.yC = this.yC-20;
        
            this.indexI = this.indexI-1; 
            this.indexJ = this.indexJ-1; 
         
            
          //if the target is close, take shots   
          } else {
            
            this.needToShoot = true;
            
            
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
          
        
        //if the target is somewhat far away, move towards them
          if(totalDifference >=  10) {
          
             this.xC = this.xC-20; 
             this.yC = this.yC+20;
        
             this.indexI = this.indexI-1; 
             this.indexJ = this.indexJ+1; 
        
         
            
          //if the target is close, take shots   
          } else {
            
            this.needToShoot = true;
            
            
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
          
        
        //if the target is somewhat far away, move towards them
          if(totalDifference >=  10) {
          
              
             this.yC = this.yC+20;
             this.indexJ = this.indexJ+1; 
        
         
            
          //if the target is close, take shots   
          } else {
            
            this.needToShoot = true;
            
            
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
          
        
        //if the target is somewhat far away, move towards them
          if(totalDifference >=  10) {
          
              
             this.yC = this.yC-20;
             this.indexJ = this.indexJ-1; 
        
         
            
          //if the target is close, take shots   
          } else {
            
            this.needToShoot = true;
            
            
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
          
        
        //if the target is somewhat far away, move towards them
          if(totalDifference >=  10) {
          
              
             this.xC = this.xC+20;
             this.indexI = this.indexI+1; 
        
         
            
          //if the target is close, take shots   
          } else {
            
            this.needToShoot = true;
            
            
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
          
        
        //if the target is somewhat far away, move towards them
          if(totalDifference >=  10) {
          
              
             this.xC = this.xC - 20;
             this.indexI = this.indexI-1; 
        
         
            
          //if the target is close, take shots   
          } else {
            
            this.needToShoot = true;
            
            
          }
        
        
        
      }
    
  }
  
}
