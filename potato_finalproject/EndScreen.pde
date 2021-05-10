class EndScreen {
  PFont retro = createFont("RetroGaming.ttf", 15);
  PImage background;
  Button restart, quit;
  color clear, darker;
  boolean p1victory = true;
  
  EndScreen() {
    background = loadImage("endscreen.png");
    clear = color(0,0,0,100);
    darker = color(0,0,0,50);
    restart = new Button(200, 775, 355, 45, "Play Again", darker, clear);
    quit = new Button(600, 775, 355, 45, "Quit", darker, clear);
  }
  
  void display() {
    image(background, 0, 0, width, height);
    textFont(retro);
    fill(#ffffff);
    textAlign(CENTER);
    textSize(30);
    text("Welcome to the Hall of Fame", 400, 500);
    text("What would you like to do next?", 400, 675);
    
    if(p1victory) {
      text("Congratulations Player 1!", 400, 550);
      text("Sorry Player 2", 400, 600);
      p1_pokemon.display();
    }
    else {
      text("Congratulations Player 2!", 400, 550);
      text("Sorry Player 1", 400, 600);
      p2_pokemon.display();
    }
    
    restart.display();
    quit.display();
  }
}
