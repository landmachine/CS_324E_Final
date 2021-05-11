class EndScreen {
  PFont retro = createFont("RetroGaming.ttf", 15);
  PImage background;
  Button restart, quit;
  color clear, darker;
  float x;
  float y;
  PShape firework, all, pokemon;
  PVector position, velocity, gravity;
  float c;
  
  EndScreen() {
    background = loadImage("data/endscreen.png");
    clear = color(0,0,0,100);
    darker = color(0,0,0,50);
    restart = new Button(200, 775, 355, 45, "Play Again", darker, clear);
    quit = new Button(600, 775, 355, 45, "Quit", darker, clear);
    
    position = new PVector();
    this.position.x = 0;
    this.position.y = 0;
    
    if(p1victory) {
      String image_id = p1_pokemon.name + ".svg";
      pokemon = loadShape(image_id);
    }
    else {
      String image_id = p2_pokemon.name + ".svg";
      pokemon = loadShape(image_id);
    }
    //PShape pokemon = loadShape("Charizard.svg");
    firework = loadShape("firework.svg");
    this.all = createShape(GROUP);
    this.all.addChild(firework);
    this.all.addChild(pokemon);
    
    shapeMode(CENTER);
    position = new PVector(-50,-50);
    velocity = new PVector(1.5, 2.1);
    gravity = new PVector(0, 0.2);
    c = PI/6;
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
    }
    else {
      text("Congratulations Player 2!", 400, 550);
      text("Sorry Player 1", 400, 600);
    }
    
    restart.display();
    quit.display();
    shape(all, position.x, position.y);
  }
  
  void move() {
    position.add(velocity);
    
    if(position.x > 300 || position.x < -300){
      velocity.x = velocity.x * -1;
    }
    if(position.y > 0 || position.y < -200) {
      velocity.y = velocity.y * -.95;
    }
    
    c += PI/16;
    this.firework.translate(width/2, height/2);
    this.firework.rotate(c);
    this.firework.translate(-(width/2), -(height/2));
  }
}
