
PGraphics canvas;

int canvas_wid = 5100; 
int canvas_hei = 7650;

float ratio_wid = 1;
float ratio_hei = 1;
float ratio = 1;


int N = 50;
float bigR = canvas_wid*1.04; //330;
float smallR = canvas_wid/27;
float _ratio = 0.6;
float rotation = 4 * PI / 180;

void setup() {
  size(260, 390);
  background(0);

  canvas = createGraphics(canvas_wid, canvas_hei, P2D);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.noStroke();
  for (int j=-10; j<10; j+=1) {
    canvas.beginShape(TRIANGLES);
    canvas.fill(235);
    canvas.smooth();
    canvas.strokeWeight(2*20);
    canvas.vertex(canvas.width*3/4, canvas.height/1.8*j);
    canvas.vertex(canvas.width/2.5, canvas.height/4.5*j);
    canvas.vertex(canvas.width/18, canvas.height/5.7);
    canvas.endShape();
  }


  canvas.translate(canvas.width/2.5, canvas.height/1.5);
  canvas.rotate(PI/6);
  canvas.smooth();
  canvas.strokeWeight(0.2*20);
  canvas.fill(248);
  canvas.stroke(150);



  for (float i = 0; i < N; i++)
  {
    float rad =  bigR-(bigR-smallR)*i/N;
    canvas.ellipse(0, 0, rad, rad * _ratio);
    canvas.rotate(rotation);
  }

  canvas.endDraw();


  float resizedWidth = (float) canvas.width*ratio;
  float resizedHeight = (float) canvas.height*ratio;

  //image(canvas, width*0.1, height*0.1);
  image(canvas, 0, 0, resizedWidth, resizedHeight);
  //image(canvas, 0, 0);
  canvas.save("sharp.tiff");
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

