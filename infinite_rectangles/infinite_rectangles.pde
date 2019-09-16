float unit;
int num = 100;
int y;
float[][] states = new float[num][3];
int colorUnit = 60;
float colorDiff;

int skipCount = 10;

int iteration = 0;

float updateColor(float value) {
  if (iteration % skipCount == 0 ) {
    // colorDiff = random(-colorUnit, colorUnit);
    colorDiff = random(-colorUnit, colorUnit); // cool white/black boxes
    skipCount = (int) random(1, 40);
  }

  // if (value + colorDiff < 0) {
  //   value += (-1*colorDiff) / skipCount;
  // } else if (value + colorDiff > 255) {
  //   value += (-1*colorDiff) / skipCount;
  // } else {
  //   value += colorDiff / skipCount;
  // }

  return abs(value + (colorDiff/skipCount)) % 255 ;
}


void setup() {
  noStroke();
  size(800, 800);
  unit = width/(2*num);
  rectMode(CORNER);

  for (int i=0; i<num; i++) {
    states[i][0] = random(0, 255);
    states[i][1] = random(0, 255);
    states[i][2] = random(0, 255);
  }
}


void draw() {

  for (y=0; y<num-1; y++) {
      states[y][0] = states[y+1][0];
      states[y][1] = states[y+1][1];
      states[y][2] = states[y+1][2];

      fill(states[y][0], states[y][1], states[y][2]);
      rect(unit*y, unit*y, unit, height-(2*unit*y));
      rect(unit*y, unit*y, width-(2*unit*y), unit);
      rect(unit*y, height-unit*y, width-(2*unit*y), unit);
      rect(width-unit*y, unit*y, unit, height-(2*unit*y - unit));

  }

  states[num-1][0] = updateColor(states[num-1][0]);
  states[num-1][1] = updateColor(states[num-1][1]);
  states[num-1][2] = updateColor(states[num-1][2]);


  fill(states[y][0], states[y][1], states[y][2]);
  rect(unit*y, unit*y, width-(2*unit*(num-1.5)), height-(2*unit*(num-1.5)));

  iteration++;
  delay(100);
}