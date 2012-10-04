PGraphics canvas;
int canvas_width = 5100;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

float xPos;
float yPos;


void setup() {
  size (500, 500);
  background (255);
  colorMode(HSB, 100);
  frameRate(10);
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.colorMode(HSB, 100);
  canvas.endDraw();

  xPos = width / 2;
  yPos = height / 2;
}

void draw() {

  float newXpos = xPos + random(-20, 20);
  float newYpos = yPos + random(-20, 20);
  
  canvas.beginDraw();

  float abstand = dist (xPos, yPos, newXpos, newYpos);
  float thickness = 50 - abstand;
  if (thickness < 20) {
    thickness = 5;
  }
  thickness/=ratio;
  canvas.strokeWeight (thickness);
  canvas.line (xPos /ratio, yPos /ratio, newXpos /ratio, newYpos /ratio);

  canvas.filter(DILATE);
  canvas.filter(BLUR);     
  
  canvas.endDraw();

  float resizedWidth = (float) canvas.width*ratio;
  float resizedHeight = (float) canvas.height*ratio;

  image(canvas, 0, 0, resizedWidth, resizedHeight);
  
  xPos = newXpos;
  yPos = newYpos;
  canvas.stroke((sin(millis()))*100, 50, 50);
}


void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight) {
    ratio = ratioWidth;
  }
  else {
    ratio = ratioHeight;
  }
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

