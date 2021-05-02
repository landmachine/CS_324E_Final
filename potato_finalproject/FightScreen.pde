class FightScreen {
  HealthBar p1Health, p2Health;
  Button[] p1Moves;
  Button[] p2Moves;

//Constructor
  FightScreen() {
    p1_pokemon.pos = new PVector(width / 4, height / 2);
    p2_pokemon.pos = new PVector(3 * width / 4, height / 2);

    p1Moves = new Button[] {
      new Button(2 * width/3, 650, 150, 75, "MOVE 1"), 
      new Button(width - 90, 650, 150, 75, "MOVE 2"), 
      new Button(2 * width/3, 750, 150, 75, "MOVE 3"), 
      new Button(width -90, 750, 150, 75, "MOVE 4")
    };

    p2Moves = new Button[] {
      new Button(width/3, 650, 150, 75, "MOVE 1"), 
      new Button(90, 650, 150, 75, "MOVE 2"), 
      new Button(width/2, 750, 150, 75, "MOVE 3"), 
      new Button(90, 750, 150, 75, "MOVE 4")
    };

    textSize(20);
    p1Health = new HealthBar(width/2 - 200, height/2 - 200, 100, "Player1");
    p2Health = new HealthBar(width/2 + 200, height/2 - 200, 100, "Player2");
  }

  void display() {
    background(100);
    p1_pokemon.display();
    fill(255);
    text("Player 1", width / 4, height / 2);
    p2_pokemon.display();
    fill(255);
    text("Player 2", 3 * width / 4, height / 2);

    for (Button button : p1Moves) {
      button.display();
    }

    for (Button button : p2Moves) {
      button.display();
    }

    p1Health.display();
    p2Health.display();
  }
}
