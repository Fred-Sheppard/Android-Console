class Console {

  StringList history;
  String disp;
  int y;
  int maxHistoryLength = 50;
  int textSize = 40;
  float ctextSize;
  color fgcolour, bgcolour;
  boolean scrolling = false;
  boolean isTyping = true;
  String typing = "";
  boolean cursor = false;

  Console() {
    history = new StringList();
    bgcolour = #000000;
    fgcolour = #ffffff;
    ctextSize = textSize*displayDensity;
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
    if (isTyping) {
      float yy = (1.35*textAscent()+textDescent())
        *history.size()+y;
      text(typing, 0, yy);
      if (cursor) {
        text("|", textWidth(typing), yy);
      }
    }
    /*if (frameCount%30 == 0) {
     cursor = !cursor;}*/
    cursor = frameCount%30==0 ^ cursor; //nice
  }

  void requestInput(String message) {
    isTyping = true;
    log(message);
  }

  void keyPressed() {
    if (key == CODED) {
      if (keyCode == 67 && typing.length() > 0) {
        typing = typing.substring(0, typing.length()-1);
      } else if (keyCode == 66) {
        sendInput(typing);
        return;
      }
    } else { //key != CODED
      typing += key;
    }
  }

  void sendInput(String input) {
    isTyping = false;
    typing = "";
    String s = "Your input was: " + input;
    log(s);
  }

  void touchStarted() {
    scrolling = true;
    if (mouseX > width*.8) openKeyboard();
  }

  void touchEnded() {
    scrolling = false;
  }
}
