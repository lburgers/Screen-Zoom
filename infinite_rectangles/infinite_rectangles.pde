int currentStage;
float colorDiff, unit, nextColor;

JSONArray json;
ArrayList<ZoomDisplay> d = new ArrayList<ZoomDisplay>();


void setup() {
  noStroke();
  colorMode(HSB, 360);
  rectMode(CORNER);
  // size(800, 800);
  fullScreen();
  
  json = loadJSONArray("data.json");
  for (int i=0; i < json.size(); i++) {
    JSONObject values = json.getJSONObject(i);
    d.add(new ZoomDisplay(values.getInt("x"), values.getInt("y"), values.getInt("width"), values.getInt("height")));
  }
}


void draw() {
  for (int i=0; i < d.size(); i++) {
    d.get(i).update();
  }
  delay(100);
}