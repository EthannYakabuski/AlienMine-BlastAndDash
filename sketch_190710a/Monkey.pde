class Monkey extends Enemy {
  
  PImage[] images = new PImage[3];
  
  //100 health
  //20 attack
  
  
  //for testing spawns an ant (0,0)
  Monkey() {
    super(300, 3, 0, 0, 0, 0, "Monkey", 35);
    images[0] = loadImage("monkey.JPG");
    
    images[0].resize(20,20);
   
  }
  
  
  //for when the location is specified
  Monkey(float x, float y) {
    super(300, 3, x, y, x/20, y/20, "Monkey", 35);
    images[0] = loadImage("monkey.JPG");
   
  
    images[0].resize(20,20);
    
  }
  
  
  void show() {
    
     image(images[0], this.xC, this.yC);
  }
  
  void move(int targetX, int targetY) {
    
    
     
     Random r = new Random();
   
   int streamSize = 10; 
   int start = 0; 
   int bound = 9; 
   int outcomeMin = 0; 
   int outcomeBound = 1;
   
   r.ints(streamSize, start, bound);
   
   int randomNess = r.nextInt(outcomeBound+1-outcomeMin) + outcomeMin;
   
   
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
      
      
        if( (targetX > myLocX)&(targetY > myLocY) ) {
        
          //System.out.println("TOOK A STEP FOR REAL 1"); 
        
          this.xC = this.xC+20; 
          this.yC = this.yC+20;
        
          this.indexI = this.indexI+1; 
          this.indexJ = this.indexJ+1; 
          
          if(randomNess == 1) { this.xC = this.xC+20; this.indexI = this.indexI+1; }
        
        } else if ( (targetX > myLocX)&(targetY<myLocY) ) {
        
          //System.out.println("TOOK A STEP FOR REAL 2"); 
        
          this.xC = this.xC+20; 
          this.yC = this.yC-20;
        
          this.indexI = this.indexI+1; 
          this.indexJ = this.indexJ-1; 
          
          if(randomNess == 1) { this.xC = this.xC+20; this.indexI = this.indexI+1; }
        
        } else if ( (targetX < myLocX)&(targetY < myLocY) ) {
        
          //System.out.println("TOOK A STEP FOR REAL 3"); 
        
          this.xC = this.xC-20; 
          this.yC = this.yC-20;
        
          this.indexI = this.indexI-1; 
          this.indexJ = this.indexJ-1; 
          
          if(randomNess == 1) { this.xC = this.xC-20; this.indexI = this.indexI-1; }
        
      } else if ( (targetX < myLocX)&(targetY > myLocY) ) {
        
        //System.out.println("TOOK A STEP FOR REAL 4"); 
        
        this.xC = this.xC-20; 
        this.yC = this.yC+20;
        
        this.indexI = this.indexI-1; 
        this.indexJ = this.indexJ+1; 
        
        if(randomNess == 1) { this.xC = this.xC-20; this.indexI = this.indexI-1; }
        
      } else if ( (targetX == myLocX)&(targetY > myLocY) ) {
        
        //System.out.println("TOOK A STEP FOR REAL 5");
        
        this.yC = this.yC+20; 
        
        this.indexJ = this.indexJ+1; 
        
        this.xC = this.xC+20;
        
        this.indexI = this.indexI+1;
        
        if(randomNess == 1) { this.xC = this.xC+20; this.indexI = this.indexI+1; }
        
      } else if ( (targetX == myLocX)&(targetY < myLocY) ) {
        
        //System.out.println("TOOK A STEP FOR REAL 6");
        
        this.yC = this.yC-20; 
        
        this.indexJ = this.indexJ-1; 
        
        this.xC = this.xC-20;
        
        this.indexI = this.indexI-1;
        
        if(randomNess == 1) { this.xC = this.xC-20; this.indexI = this.indexI-1; }
        
      } else if ( (targetX > myLocX)&(targetY == myLocY) ) {
        
        //System.out.println("TOOK A STEP FOR REAL 7"); 
        
        this.xC = this.xC+20;
        
        this.indexI = this.indexI+1; 
        
        this.xC = this.xC+20;
        
        this.indexI = this.indexI+1;
        
        if(randomNess == 1) { this.xC = this.xC+20; this.indexI = this.indexI+1; }
        
      } else if ( (targetX < myLocX)&(targetY == myLocY) ) {
        
        //System.out.println("TOOK A STEP FOR REAL 8"); 
        
        this.xC = this.xC-20; 
        
        this.indexI = this.indexI-1; 
        
        this.xC = this.xC-20;
        
        this.indexI = this.indexI-1;
        
        if(randomNess == 1) { this.xC = this.xC-20; this.indexI = this.indexI-1; }
        
      }
    
  }
  
  
}
