class FightScreen {
  HealthBar p1Health, p2Health;
  
  FightScreen() {
    p1 = new Pokemon(new PVector(width / 4, height / 2));
    p2 = new Pokemon(new PVector(3 * width / 4, height / 2));
    rectMode(CORNER);
    move1Button = new Button(450, 650, 200, 75, "MOVE 1");
    move2Button = new Button(675, 650, 200, 75, "MOVE 2");
    move3Button = new Button(450, 750, 200, 75, "MOVE 3");
    move4Button = new Button(675, 750, 200, 75, "MOVE 4");
    textSize(20);
    p1Health = new HealthBar(width/2 - 200, height/2 - 200, 100, "Player1");
    p2Health = new HealthBar(width/2 + 200, height/2 - 200, 100, "Player2");
  }

  void display() {
    background(100);
    p1.display();
    fill(255);
    text("Player 1", width / 4, height / 2);
    p2.display();
    fill(255);
    text("Player 2", 3 * width / 4, height / 2);
    
    move1Button.display();
    move2Button.display();
    move3Button.display();
    move4Button.display();
    text("Other player move buttons", 160, 750);
    
    p1Health.display();
    p2Health.display();
  }
}
