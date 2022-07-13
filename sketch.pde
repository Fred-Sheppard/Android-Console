Console console;

void setup(){
  fullScreen();
  console = new Console();
  for (int i = 1; i < 5; i++){
    console.log(char(i+64));
    console.log(i);
  }
  console.log(console.history.size());
}

void draw(){
  console.display();
}

void touchStarted(){
  console.scrolling = true;
  if (mouseX > width*.8) openKeyboard();
}

void touchEnded(){
  console.scrolling = false;
}

void keyPressed(){
  if (key != CODED && keyCode != 66)
  console.typing += key;
}