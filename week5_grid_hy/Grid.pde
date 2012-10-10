
class ModularGrid
{

  int cols;
  int rows;
  float gutterSize;
  float pageMargin;
  Module[][] modules;
  float moduleWidth;
  float moduleHeight;

  ModularGrid(int _cols, int _rows, float _gutterSize, float _pageMargin)
  {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    pageMargin = _pageMargin;

    modules = new Module[cols][rows];

    // cache the width of each column. Remember to cast as float, otherwise the columns will not line up
    // First we find the width of the page without the pagemargin
    float actualPageWidth = ((float)width - (2*pageMargin));
    // then we find the gutter sizes. We subtract by 1 as the furthermost right module will not have a right-side gutter
    float totalGutterWidth = (cols-1) * gutterSize;
    // then we simply find the column size by subtracting the gutterwidth from the page size and dividing by number of cols
    moduleWidth = (actualPageWidth - totalGutterWidth) / (float)cols;

    // cache the height of each column. This is the exact same calculation as before, and we should probably put
    float actualPageHeight = ((float)height - (2*pageMargin));
    float totalGutterHeight = (rows-1) * gutterSize;
    moduleHeight = (actualPageHeight - totalGutterHeight) / (float)rows;

    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        modules[i][j] = new Module();
        modules[i][j].x = pageMargin + (i*moduleWidth) + (i*gutterSize);
        modules[i][j].y = pageMargin + (j*moduleHeight) + (j*gutterSize);
        modules[i][j].w = moduleWidth;
        modules[i][j].h = moduleHeight;
      }
    }
  }

  Module getRandomModule()
  {
    // get all modules that are not used
    ArrayList<Module> notUsedModules = new ArrayList();

    for (int i = 0; i < cols; i++)
    {
      for (int j = 0; j < rows; j++)
      {
        if (!modules[i][j].used)
        {
          notUsedModules.add(modules[i][j]);
        }
      }
    }

    // select a random module, set used to true, and return it
    int ranIndex = floor(random(notUsedModules.size()));
    Module selected = notUsedModules.get(ranIndex);
    selected.used = true;
    return selected;
  }

  void display()
  {
    canvas.beginDraw();
    canvas.background(13);
    canvas.noFill();
    canvas.pushMatrix();
    //strokeWeight(1);
    //stroke(50);
    canvas.noStroke();
    int h_ = (int) random(50);
    int s_ = 70;
    float b_= 100;
    colorMode(HSB, 100);

    for (int i = 0; i < cols; i++)
    {
      canvas.fill(i*(h_+88) %90, i*(s_+60), b_);

      for (int j = 0; j < rows; j++)
      {
        float w = modules[i][j].w;
        float h = modules[i][j].h;

        canvas.fill((i+j)*(h_+78) %85, (i*2)+60*s_%85, b_);

        canvas.triangle(modules[i][j].x, modules[i][j].y, modules[i][j].x, 
        modules[i][j].y+modules[i][j].w, modules[i][j].x+modules[i][j].w, modules[i][j].y+modules[i][j].h);
        //    triangle(0,0,w,0,w,h);
        canvas.fill((i+j)*(h_+10) %85, i+60*s_%85, b_);

        canvas.triangle(modules[i][j].x, modules[i][j].y, modules[i][j].x+modules[i][j].w, 
        modules[i][j].y, modules[i][j].x+modules[i][j].w, modules[i][j].y+modules[i][j].h);
        //    triangle(0,0,0,h,w,h);
      }
    }
    canvas.popMatrix();
    canvas.endDraw();
    //popMatrix();
  }



}

