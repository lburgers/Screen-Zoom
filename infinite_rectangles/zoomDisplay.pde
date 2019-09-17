/*
  Lukas Burger
  Generative art piece for rectangle infinite zoom
  Made specifically for Becton Cafe screen
*/

class ZoomDisplay {
  int num = 10, skipCount = 10, iteration = 0;
  int topX, topY, boxWidth, boxHeight;
  float unit;
  float[] states;
  ZoomDisplay (int x, int y, int w, int h) {
    // set the screen coordinates  
    topX = x; 
    topY = y;
    boxWidth = w; 
    boxHeight = h; 
    num = (int) w/3; // set the number of rectangles
    unit = boxWidth/(2*num); // set the rectangle thickness
    states = new float[num];
    for (int i=0; i<num; i++) {
      states[i] = random(0, 360); // randomly initialize
    }
  }

  float updateColor(float value) {
    // update the color only if skipCount updates have passed
    if (iteration % skipCount == 0 ) {
      nextColor = random(0, 360); // next random hue
      skipCount = (int) random(5, num); // next amount of updates to skip
    }
    currentStage = skipCount - (iteration % skipCount);
    colorDiff = nextColor - value;
    return value + (colorDiff/currentStage); // update color smoothly
  }

  void update() {
    for (int y=0; y<num-1; y++) {
        states[y] = states[y+1]; // move rectangle colors outwards
        // draw four edges of rect
        fill(states[y], 360, 360);
        rect(topX + unit*y, topY + unit*y, unit, boxHeight-(2*unit*y));
        rect(topX + unit*y, topY + unit*y, boxWidth-(2*unit*y), unit);
        rect(topX + unit*y, topY + boxHeight-unit*y, boxWidth-(2*unit*y), unit);
        rect(topX + boxWidth-unit*y, topY + unit*y, unit, boxHeight-(2*unit*y - unit));
    }
    // update center rect color
    states[num-1] = updateColor(states[num-1]);
    // draw center rect
    fill(states[num-1], 360, 360);
    rect(topX + unit*(num-1), topY + unit*(num-1), boxWidth-(2*unit*(num-1.5)), boxHeight-(2*unit*(num-1.5)));
  
    iteration++;
  }
}
