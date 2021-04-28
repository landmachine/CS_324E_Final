class FightScreen {

  FightScreen() {
    p1 = new Pokemon(new PVector(width / 4, height / 2));
    p2 = new Pokemon(new PVector(3 * width / 4, height / 2));
    rectMode(CORNER);
    move1Button = new Button(450, 650, 200, 75, "MOVE 1");
    move2Button = new Button(675, 650, 200, 75, "MOVE 2");
    move3Button = new Button(450, 750, 200, 75, "MOVE 3");
    move4Button = new Button(675, 750, 200, 75, "MOVE 4");
    textSize(20);
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
    text("health or whatever goes here", 160, 750);
  }
}
