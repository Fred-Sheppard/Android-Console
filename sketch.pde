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
  console.touchStarted();
}

void touchEnded(){
  console.touchEnded();
}

void keyPressed(){
  console.keyPressed();
}