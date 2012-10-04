int rad = 20;
int maxNum=6;

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
float ds = 0.1, db = 1;

void setup() {
  size(1000, 400);
  noFill();
  smooth();
  frameRate(10);
}


void draw() {
  background(18);
  // draw normal letters
  pushMatrix();
  translate(width/2 - (blockSize*32/2), height/2 - (blockSize*8/2));
  colorMode(HSB, 85); 
  h = (h + 55) % 85; // == (h-30) % 85 // h<85
  s = 45; 
  b = 80 + (b + 1) % 85;
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
            s = s + ds;
            //if (s < 60 || s > 160) ds *= -1;
            if ( s < 20 || s > 35 ){
              ds *= -1;
            }
            stroke(h, s, b);          
            float r = sqrt((x-2)*(x-2) + (y-3)*(y-3));
            strokeWeight(0.8 / r);
            ellipse(10*x, 10*y, rad/r, rad*0.2/r);
          }
          b = b + 0.5;
          if (b < 60 || b > 160) db *= -1;
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

