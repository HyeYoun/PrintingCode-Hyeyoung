int[][] letters = {
  
  {0, 0, 1, 1, 0, 0, 0,  // C
   0, 1, 0, 0, 1, 0, 0, 
   1, 0, 0, 0, 0, 1, 0, 
   1, 0, 0, 0, 0, 0, 0, 
   1, 0, 0, 0, 0, 0, 0, 
   1, 0, 0, 0, 0, 1, 0, 
   0, 1, 0, 0, 1, 0, 0, 
   0, 0, 1, 1, 0, 0, 0},
   
   {0, 0, 1, 1, 0, 0, 0, // 0
    0, 1, 0, 0, 1, 0, 0,
    1, 0, 0, 0, 0, 1, 0,
    1, 0, 0, 0, 0, 1, 0,
    1, 0, 0, 0, 0, 1, 0,
    1, 0, 0, 0, 0, 1, 0,
    0, 1, 0, 0, 1, 0, 0,
    0, 0, 1, 1, 0, 0, 0},
   
   {0, 1, 1, 1, 0, 0, 0, // D
    1, 0, 0, 0, 1, 0, 0,
    1, 0, 0, 0, 0, 1, 0,
    1, 0, 0, 0, 0, 1, 0,
    1, 0, 0, 0, 0, 1, 0,
    1, 0, 0, 0, 0, 1, 0,
    1, 0, 0, 0, 1, 0, 0,
    0, 1, 1, 1, 0, 0, 0},
   
   {0, 1, 1, 1, 1, 0, 0, // E
    1, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0,
    1, 1, 1, 1, 1, 0, 0,
    1, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0,
    1, 0, 0, 0, 0, 0, 0,
    0, 1, 1, 1, 1, 0, 0}, 
};

int blockSize = 15;

void setup(){
  size(500, 750);
  noStroke();
  background(255);
  fill(50);
  smooth();
}

void draw(){

  // draw normal letters
  pushMatrix();
  translate(width/2 - (blockSize/2*28), height/2 - (blockSize/2*8));
  rectMode(CENTER);
  for(int i = 0; i < letters.length; i++){
     int xPos = 0;
     int yPos = 0;
    
     // for each letter, draw pixel dots
     for(int j = 0; j < letters[i].length; j++){
        if(letters[i][j] == 1){
          pushMatrix();
          translate(xPos, yPos);
          rotate(radians(random(-10, 10)));
          rect(0, 0, blockSize, blockSize);
          popMatrix();
        } 
        
        xPos += blockSize;
        
        if(j % 7 == 6){
          xPos = 0;
          yPos += blockSize; 
        }
        
     }
     
     translate(blockSize * 7, 0);
  }
  popMatrix();
}

/*
 // draw normal letters
  pushMatrix();
  translate(400, 150);
  for(int i = 0; i < letters.length; i++)
  {
     int xPos = 0;
     int yPos = 0;
    
     // for each letter, draw pixel dots
     for(int j = 0; j < letters[i].length; j++)
     {
        if(letters[i][j] == 1)
        {
          rect(xPos, yPos, blockSize, blockSize);
        }
        
        xPos += blockSize;
        
        if(j % 4 == 3)
        {
          xPos = 0;
          yPos += blockSize; 
        }
     }
     
     translate(blockSize * 6, 0);
  }
  popMatrix();
  */
