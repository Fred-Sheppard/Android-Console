Console console;

void setup(){
  fullScreen();
  console = new Console();
  for (int i = 1; i < 20; i++){
    console.log(char(i+64));
    console.log(i);
  }
}

void draw(){
  console.display();
}

void touchStarted(){
  console.scrolling = true;
}

void touchEnded(){
  console.scrolling = false;
}