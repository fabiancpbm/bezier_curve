int DIMENSION = 3;
int DELTA_P1_P2 = 100;
int PRECISION = 1000;
void setup() {
  size(500, 500);
}

float fat(int n) {
  float result = 1;
  for (int i = n; i > 0; i--) {
    result *= i;
  }
  return result;
}

void draw() {
  background(200);
  float p1x = round(map(mouseX, 0, width, 0, 500));
  float p2x = p1x + DELTA_P1_P2 < 500 ? p1x + DELTA_P1_P2 : 500;
  float p0y = round(map(mouseY, 0, height, 0, 500));
  float[] px = {0, p1x, p2x, 500};
  float[] py = {500, p0y, p0y, 500};
  noFill();
  beginShape();
  float fatN = fat(DIMENSION);
  for (int absT = 0; absT < PRECISION; absT++) {
    float t = (float) absT / PRECISION;
    float x = 0;
    float y = 0;
    for (int i = 0; i <= DIMENSION; i++) {
      float fatI = fat(i);
      float coefNI = fatN / (fatI * fat(DIMENSION - i));
      x += coefNI * Math.pow((1-t),(DIMENSION-i)) * Math.pow(t,i) * px[i];
      y += coefNI * Math.pow((1-t),(DIMENSION-i)) * Math.pow(t,i) * py[i]; //<>//
    }
    vertex(x, y);
  }
  endShape();
}
