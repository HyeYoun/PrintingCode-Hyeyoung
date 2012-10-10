PGraphics canvas;

int canvas_wid = 5000; 
int canvas_hei = 5000;

float ratio_wid = 1;
float ratio_hei = 1;
float ratio = 1;

int rad = 21*5;
int maxNum=5;

void setup()
{
  size(750, 750);
  background(255);
  smooth();
  canvas = createGraphics(canvas_wid, canvas_hei, P2D);
  calculateResizeRatio();

  // create a grid object as a container for our grid variables
  ModularGrid grid = new ModularGrid(25, 25, 5, 200);

  // loop through 10 times and get a unique grid every time
  for (int i = 0; i < 100; i++)
  {
    Module module = grid.getRandomModule();
    //rect(module.x, module.y, module.w, module.h);
  }

  // we can even implement a function that draws the grid for us
  grid.display();
    float resizedWidth = (float) canvas.width*ratio;
  float resizedHeight = (float) canvas.height*ratio;

  image(canvas, 0, 0, resizedWidth, resizedHeight);
  canvas.save("grid.tiff");
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
