
PGraphics canvas;
int canvas_wid = 2550; // letter size, 300pixels/inch
int canvas_hei = 3300;

float ratio_wid = 1;
float ratio_hei = 1;
float ratio = 1;

int rad = 1200;
//float rad = canvas.height*0.5;



void setup() {
  size(600, 600);
  background(100);

  canvas = createGraphics(canvas_wid, canvas_hei, P2D);
  
  calculateResizeRatio();
  
  canvas.beginDraw();
    canvas.background(255);
    canvas.smooth();
    canvas.strokeWeight(30);
    canvas.fill(255);
    canvas.ellipseMode(CENTER);
    canvas.ellipse(canvas.width/2, canvas.height/2-400, rad, rad);
    canvas.triangle(canvas.width/2-500, canvas.height/2+120, canvas.width/2+500, canvas.height/2+120, canvas.width/2, canvas.height-200);
    canvas.rectMode(CENTER);
    canvas.rect(canvas.width/2, canvas.height/2, canvas.width/2-100, canvas.height/2-1200, 80,80,240,240);
    //rect(a, b, c, d, radious for top-left, top right, bottom-right, bottom-left corner)
    canvas.rectMode(CORNER);
    canvas.translate(canvas.width/2+600, 200);
    canvas.rotate(PI/5);
    canvas.rect(0, 0, 120, 600);
  canvas.endDraw();
  
  float resizedWidth = (float) canvas.width*ratio;
  float resizedHeight = (float) canvas.height*ratio;
    
  //image(canvas, width*0.1, height*0.1);
  image(canvas, 0, 0, resizedWidth, resizedHeight);
  //image(canvas, 0, 0);
  canvas.save("grab.png");
}



void draw() {
}


void calculateResizeRatio(){
  ratio_wid = (float) width / (float) canvas.width;
  ratio_hei= (float) height / (float) canvas.height;
  
  if(ratio_wid < ratio_hei){
    ratio = ratio_wid;
  }
  else{
    ratio = ratio_hei;
  }
}

