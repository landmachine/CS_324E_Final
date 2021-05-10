class FightScreen {
  HealthBar p1Health, p2Health;
  Button[] p1Moves;
  Button[] p2Moves;
  int moveAmount = 4;
  Table typeChart;
  int p1choice, p2choice;
  boolean player1Turn;
  PImage background;
  color moveColor = color(0, 0, 0, 100);
  color floatColor = color(0, 0, 0, 50);
  int retroSize = 15;
  PFont retro = createFont("RetroGaming.ttf", retroSize);

  //Constructor
  FightScreen() {
    //background = loadImage("bg.png");
    background = loadImage("fightbackground.png");

    p1choice = -1;
    p2choice = -1;
    player1Turn = true;

    p1Moves = new Button[] {
      new Button(90, 650, 150, 60, "MOVE 1", floatColor, moveColor), 
      new Button(width/3, 650, 150, 60, "MOVE 2", floatColor, moveColor), 
      new Button(90, 750, 155, 60, "MOVE 3", floatColor, moveColor), 
      new Button(width/3, 750, 155, 60, "MOVE 4", floatColor, moveColor)
    };

    p2Moves = new Button[] {
      new Button(2 * width/3, 650, 150, 60, "MOVE 1", floatColor, moveColor), 
      new Button(width - 90, 650, 150, 60, "MOVE 2", floatColor, moveColor), 
      new Button(2 * width/3, 750, 155, 60, "MOVE 3", floatColor, moveColor), 
      new Button(width -90, 750, 155, 60, "MOVE 4", floatColor, moveColor)
    };

    typeChart = loadTable("typechart.csv", "header");

    textSize(20);
    p1Health = new HealthBar(width/2 - 200, height/2 - 200, 100, "Player1");
    p2Health = new HealthBar(width/2 + 200, height/2 - 200, 100, "Player2");

  }

  void display() {
    //background(100);
    imageMode(CORNERS);
    image(background, 0, 0, width, height);
    p1_pokemon.display();
    p2_pokemon.display();

    for (Button button : p1Moves) {
      button.display();
    }

    for (Button button : p2Moves) {
      button.display();
    }

    p1Health.display();
    textSize(retroSize);
    p2Health.display();
    textSize(retroSize);

    if (p1choice >= 0 && p2choice >= 0) {
      fight();
    }
    textFont(retro);
    if (p1choice == p2choice) {
      text("What will Player 1 do?", 400, 565);
      player1Turn = true;
    } else {
      text("What will Player 2 do?", 400, 565);
      player1Turn = false;

    }
  }


  void update_moves() {
    for (int i=0; i<moveAmount; i++) {
      p1Moves[i].text = p1_pokemon.move_names[i];
      p2Moves[i].text = p2_pokemon.move_names[i];
    }
  }

  void fight() {
    //Calculation for damage caused by p1_pokemon

    String p1_movetype = p1_pokemon.move_types[p1choice];
    float typeMult_p1_p2 = typeChart.findRow(p1_movetype, "Attacking").getFloat(p2_pokemon.type1) *
      typeChart.findRow(p1_movetype, "Attacking").getFloat(p2_pokemon.type2);

    float damagep1_p2 = (p1_pokemon.move_powers[p1choice] * (p1_pokemon.attack/ p2_pokemon.defense))/5 * 
      random(0.85, 1) * typeMult_p1_p2;

    //Calculation for damage caused by p2_pokemon
    String p2_movetype = p2_pokemon.move_types[p2choice];
    float typeMult_p2_p1 = typeChart.findRow(p2_movetype, "Attacking").getFloat(p1_pokemon.type1) *
      typeChart.findRow(p2_movetype, "Attacking").getFloat(p1_pokemon.type2);

    float damagep2_p1 = (p2_pokemon.move_powers[p2choice] * (p2_pokemon.attack/ p1_pokemon.defense))/5 * 
      random(0.85, 1) * typeMult_p2_p1;

    //Update Health Bars
    p1Health.updateHealth((int)damagep2_p1);
    p2Health.updateHealth((int)damagep1_p2);

    //Reset move choices for next turn
    p1choice = -1;
    p2choice = -1;
  }
}
