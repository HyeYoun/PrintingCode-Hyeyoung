int rad = 21;
int maxNum=5;

int[][] letters = {
  {
    0, 0, 1, 1, 0, 0, 0, 0, // C
    0, 1, 0, 0, 1, 0, 0, 0, 
    1, 0, 0, 0, 0, 1, 0, 0, 
    1, 0, 0, 0, 0, 0, 0, 0, 
    1, 0, 0, 0, 0, 0, 0, 0, 
    1, 0, 0, 0, 0, 1, 0, 0, 
    0, 1, 0, 0, 1, 0, 0, 0, 
    0, 0, 1, 1, 0, 0, 0, 0
  }
  , 

  {
    0, 0, 1, 1, 0, 0, 0, 0, // 0
    0, 1, 0, 0, 1, 0, 0, 0, 
    1, 0, 0, 0, 0, 1, 0, 0, 
    1, 0, 0, 0, 0, 1, 0, 0, 
    1, 0, 0, 0, 0, 1, 0, 0, 
    1, 0, 0, 0, 0, 1, 0, 0, 
    0, 1, 0, 0, 1, 0, 0, 0, 
    0, 0, 1, 1, 0, 0, 0, 0
  }
  , 

  {
    0, 1, 1, 1, 0, 0, 0, 0, // D
    1, 0, 0, 0, 1, 0, 0, 0, 
    1, 0, 0, 0, 0, 1, 0, 0, 
    1, 0, 0, 0, 0, 1, 0, 0, 
    1, 0, 0, 0, 0, 1, 0, 0, 
    1, 0, 0, 0, 0, 1, 0, 0, 
    1, 0, 0, 0, 1, 0, 0, 0, 
    0, 1, 1, 1, 0, 0, 0, 0
  }
  , 

  {
    0, 1, 1, 1, 1, 0, 0, 0, // E
    1, 0, 0, 0, 0, 0, 0, 0, 
    1, 0, 0, 0, 0, 0, 0, 0, 
    1, 1, 1, 1, 1, 0, 0, 0, 
    1, 0, 0, 0, 0, 0, 0, 0, 
    1, 0, 0, 0, 0, 0, 0, 0, 
    1, 0, 0, 0, 0, 0, 0, 0, 
    0, 1, 1, 1, 1, 0, 0, 0
  }
  ,
};

int blockSize = 20;

int h = (int)random(85);
float s = 100, b = 100;

void setup() {
  size(1000, 400);
  noFill();
  smooth();
  frameRate(10);
}


void draw() {
  background(13);
  // draw normal letters
  pushMatrix();
  translate(width/2 - (blockSize*32/2)+20, height/2 - (blockSize*8/2)-20);
  colorMode(HSB, 85); 
  h = (h + 55) % 85; // == (h-30) % 85 // h<85
  s = 23; 
  b = 83;
  println( h + "," + s + "," + b );

  for (int i = 0; i < letters.length; i++) {
    int xPos = 0;
    int yPos = 0;
    // for each letter, draw pixel dots
    for (int j = 0; j < letters[i].length; j++) {
      if (letters[i][j] == 1) {
        pushMatrix();
        translate(xPos, yPos);
        for (float x=0; x<maxNum; x=x+1.5) {
          for (float y=0; y<maxNum; y=y+0.4) {

            stroke(h, s, b);          
            float r = sqrt((x-2)*(x-2) + (y-3)*(y-3));
            strokeWeight(0.8 / r);
            ellipse(10*x, 10*y, rad/r, rad*0.2/r);
          }

        }
        //rotate(radians(random(-30, 30)));
        //rect(0, 0, blockSize, blockSize);
        popMatrix();
      } 

      xPos += blockSize;

      if (j % 8 == 7) {
        xPos = 0;
        yPos += blockSize;
        h = (h + 1) % 85;
      }
    }

    translate(blockSize * 8, 0);

  }
  popMatrix();
}


void mousePressed()
{
  noLoop();
}

void mouseReleased()
{
  loop();
}


