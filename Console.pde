class Console {

  StringList history;
  String disp;
  int y;
  int maxHistoryLength = 50;
  color fgcolour, bgcolour;
  boolean scrolling = false;

  Console() {
    history = new StringList();
    bgcolour = 000000;
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
    console.log(str(i));
  }

  void log(float f) {
    console.log(str(f));
  }
  void log(boolean b) {
    console.log(str(b));
  }

  void log(char c) {
    console.log(str(c));
  }


  void display() {
    if (scrolling) {
      console.y += mouseY - pmouseY;
    }
    background(bgcolour);
    fill(fgcolour);
    stroke(fgcolour);
    textSize(50*displayDensity);
    textAlign(LEFT, TOP);
    y = y>0 ? 0 : y;
    text(disp, 0, y);
  }
}
