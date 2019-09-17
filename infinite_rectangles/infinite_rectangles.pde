/*
  Lukas Burger
  Generative art piece for rectangle infinite zoom
  Made specifically for Becton Cafe screen
*/

JSONArray json;
ArrayList<ZoomDisplay> d = new ArrayList<ZoomDisplay>();


void setup() {
  noStroke();
  colorMode(HSB, 360);
  rectMode(CORNER);
  fullScreen();
  
  // save the json display specifications to an array of ZoomDisplay objects
  json = loadJSONArray("data.json");
  for (int i=0; i < json.size(); i++) {
    JSONObject values = json.getJSONObject(i);
    d.add(new ZoomDisplay(values.getInt("x"), values.getInt("y"), values.getInt("width"), values.getInt("height")));
  }
}


void draw() {
  // update the display of each screen
  for (int i=0; i < d.size(); i++) {
    d.get(i).update();
  }
  delay(100);
}