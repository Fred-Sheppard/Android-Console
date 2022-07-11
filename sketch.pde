Console console;

void setup(){
  fullScreen();
  console = new Console();
  console.log("Hello");
  console.log("World");
  for (int i = 0; i < 20; i++){
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