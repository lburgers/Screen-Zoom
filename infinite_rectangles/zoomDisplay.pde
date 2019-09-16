class ZoomDisplay {
  int num = 10, colorUnit = 60, skipCount = 10, iteration = 0;
  int topX, topY, boxWidth, boxHeight;
  float unit;
  float[] states;
  ZoomDisplay (int x, int y, int w, int h) {  
    topX = x; 
    topY = y;
    num = (int) w/3;
    states = new float[num];
    boxWidth = w; 
    boxHeight = h; 
    unit = boxWidth/(2*num);
    for (int i=0; i<num; i++) {
      states[i] = random(0, 360);
    }
  }

  float updateColor(float value) {
    if (iteration % skipCount == 0 ) {
      nextColor = random(0, 360); // cool white/black boxes
      skipCount = (int) random(5, num);
    }
    currentStage = skipCount - (iteration % skipCount);
    colorDiff = nextColor - value;
    return value + (colorDiff/currentStage);
  }

  void update() {
    for (int y=0; y<num-1; y++) {
        states[y] = states[y+1];
        fill(states[y], 360, 360);
        rect(topX + unit*y, topY + unit*y, unit, boxHeight-(2*unit*y));
        rect(topX + unit*y, topY + unit*y, boxWidth-(2*unit*y), unit);
        rect(topX + unit*y, topY + boxHeight-unit*y, boxWidth-(2*unit*y), unit);
        rect(topX + boxWidth-unit*y, topY + unit*y, unit, boxHeight-(2*unit*y - unit));
    }

    states[num-1] = updateColor(states[num-1]);
    fill(states[num-1], 360, 360);
    rect(topX + unit*(num-1), topY + unit*(num-1), boxWidth-(2*unit*(num-1.5)), boxHeight-(2*unit*(num-1.5)));
    iteration++;
  }
}
