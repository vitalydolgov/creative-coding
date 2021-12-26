int strokeWeight;
int strokeColor;

void setStrokeWeight(int w) {
  strokeWeight(w);
  strokeWeight = w;
}

void setStrokeColor(color c) {
  stroke(c);
  strokeColor = c;
}

int[] getStrokeSettings() {
  int[] settings = {strokeColor, strokeWeight};
  return settings;
}

//

void draw_bezier(float[] points, boolean draw_guides) {
  noFill();
  bezier(
    points[0], points[1], points[2], points[3],
    points[4], points[5], points[6], points[7]);
  
  if (draw_guides) {
    int[] settings = getStrokeSettings();
    stroke(0, 0, 255);
    strokeWeight(1);
    line(points[0], points[1], points[2], points[3]);
    line(points[4], points[5], points[6], points[7]);
    stroke(settings[0]);
    strokeWeight(settings[1]);
  }
}

void draw_bezier(float[] points) {
  draw_bezier(points, false);
}

void setup() {
  size(700, 180);
  translate(20, 20);
  
  int strokeWeight = 20;
  int strokeColor = 0;
  
  setStrokeColor(strokeColor);
  setStrokeWeight(strokeWeight);
  strokeCap(SQUARE);

  float wPeriod = 250;
  float wHalf = wPeriod / 2;
  float wQuater = wPeriod / 4;
  float wHeight = wPeriod / 2;
  boolean draw_guides = false;
    
  // V
  
  float[] line1 = {
    0, 0, wQuater, 0, 
    wQuater, wHeight, wHalf, wHeight
  };
  draw_bezier(line1, draw_guides);

  float[] line2 = {
    wHalf, wHeight, wHalf + wQuater, wHeight, 
    wHalf + wQuater, 0, wPeriod, 0
  };
  draw_bezier(line2, draw_guides);

  // A

  float[] line3 = {
    wPeriod, 0, wPeriod + wQuater, 0, 
    wPeriod + wQuater, wHeight, wPeriod + wHalf, wHeight
  };
  draw_bezier(line3, draw_guides);
  
  noStroke();
  fill(strokeColor);
  circle(wPeriod, wHeight / 1.5, strokeWeight * 1.2); 
  stroke(strokeColor);
  
  // I
  
  float r = wPeriod / 16;
  float[] line4 = {
    wPeriod * 1.75 + r, 0, wPeriod * 1.75, r / 2, 
    wPeriod * 1.75, r, wPeriod * 1.75, 2 * r
  };
  draw_bezier(line4);
  line(wPeriod * 1.75, 2 * r, wPeriod * 1.75, wHeight + strokeWeight / 2);
  
  // O
  
  circle(wPeriod * 2.25, wHeight / 2, wHeight);
  
  //saveFrame();
}
