class Console {

  StringList history;
  String disp;
  int y;
  int maxHistoryLength = 50;
  int textSize = 30;
  color fgcolour, bgcolour;
  boolean scrolling = false;

  Console() {
    history = new StringList();
    bgcolour = #000000;
    fgcolour = #ffffff;
  }

  void log(String str) {
    history.append(str);
    if (history.size() > maxHistoryLength) {
      history.remove(0);
    }
    StringBuilder sb = new StringBuilder();
    for (String s : history) {
      sb.append(s + "\n");
    }
    disp = new String(sb);
  }

  void log(int i) {
    log(str(i));
  }

  void log(float f) {
    log(str(f));
  }
  void log(boolean b) {
    log(str(b));
  }

  void log(char c) {
    log(str(c));
  }

  void setbgColour(color c) {
    bgcolour = c;
  }

  void setfgColour(color c) {
    fgcolour = c;
  }

  void setMaxHistoryLength(int i) {
    maxHistoryLength = i;
  } 

  void display() {
    if (scrolling) {
      console.y += mouseY - pmouseY;
    }
    background(bgcolour);
    fill(fgcolour);
    stroke(fgcolour);
    textSize(textSize*displayDensity);
    textAlign(LEFT, TOP);
    y = y>0 ? 0 : y;
    text(disp, 0, y);
  }
}
