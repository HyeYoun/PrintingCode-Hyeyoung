PGraphics canvas;
int canvas_wid = 5000; 
int canvas_hei = 2000;

float ratio_wid = 1;
float ratio_hei = 1;
float ratio = 1;

int rad = 21*5;
int maxNum=5;

int[][] letters = {  // 2 dimensional array
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

int blockSize = 100;

int h = (int)random(85);
float s = 100, b = 100;
float ds = 0.1, db = 1;

void setup() {
  size(1000, 400);
  noFill();
  smooth();
  frameRate(10);
  canvas = createGraphics(canvas_wid, canvas_hei, P2D);
  calculateResizeRatio();
}


void draw() {
  canvas.beginDraw();
  canvas.background(13);
  canvas.noFill();
  canvas.pushMatrix();
  //canvas.translate(canvas.width/2 - (blockSize*32/2)-50, canvas.height/2 - (blockSize*8/2)-200);
  canvas.translate(canvas.width/2 - (blockSize*32/2)+100, canvas.height/2 - (blockSize*8/2)-100);
  canvas.colorMode(HSB, 85); 
  h = (h + 55) % 85; // == (h-30) % 85 // h<85
  s = 23; 
  b = 83;
  for (int i = 0; i < letters.length; i++) {
    int xPos = 0;
    int yPos = 0;
    // for each letter, draw pixel dots
    for (int j = 0; j < letters[i].length; j++) {
      if (letters[i][j] == 1) {  
        canvas.pushMatrix();
        canvas.translate(xPos, yPos);
        for (float x = 0; x<maxNum; x = x+1.5) {
          for (float y = 0; y<maxNum; y = y+0.4) {
            s = s + ds;
            if ( s < 20 || s > 35 ) {
              ds *= -1;
            }
            canvas.stroke(h, s, b);          
            float r = dist(x, y, 2, 3);
            canvas.strokeWeight(0.8*4 / r);
            canvas.ellipse(50*x, 50*y, rad/r, rad*0.2/r);
          }
          b = b + 0.5;
          if (b < 60 || b > 160) db *= -1;
        }
        println( h + "," + s + "," + b );

        //rotate(radians(random(-30, 30)));
        //rect(0, 0, blockSize, blockSize);
        canvas.popMatrix();
      } 

      xPos += blockSize;

      if (j % 8 == 7) {
        xPos = 0;
        yPos += blockSize;
        h = (h + 1) % 85;
      }
    }

    canvas.translate(blockSize * 8, 0);
  }
  canvas.popMatrix();
  canvas.endDraw();

  float resizedWidth = (float) canvas.width*ratio;
  float resizedHeight = (float) canvas.height*ratio;

  image(canvas, 0, 0, resizedWidth, resizedHeight);

  //canvas.save("typography.tiff");
  noLoop();
}

void calculateResizeRatio() {
  ratio_wid = (float) width / (float) canvas.width;
  ratio_hei= (float) height / (float) canvas.height;

  if (ratio_wid < ratio_hei) {
    ratio = ratio_wid;
  }
  else {
    ratio = ratio_hei;
  }
}


void mousePressed()
{
  noLoop();
}


void mouseReleased()
{
  loop();
}


void keyPressed()
{
  if (key == 's')
  {  
    println("Saving Image");
    canvas.save("image_" + year() + "_" + month()+ "_" + day() + "_" + hour() + "_" + minute() + "_" + second() + ".tiff");
    println("Saved Image");
  }
}

