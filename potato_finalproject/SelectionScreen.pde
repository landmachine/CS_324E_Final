class SelectionScreen {
  Table excel;
  PImage background_img;
  PImage pokemon_image;
  int card_size, card_space;
  boolean player1Turn;

  Button randomPick, player1_selection, player2_selection;

  //Constructor
  SelectionScreen() {
    this.background_img = loadImage("retro2.jpg"); //background_poke.jpg

    // Load the excel file
    excel = loadTable("Pokemon.csv", "header");
    pokemonCount = excel.getRowCount();

    //initialize Cards and Pokemons using the data that is extracted from the excel file
    int counter = 0;
    for (TableRow row : excel.rows()) {
      String name = row.getString("name");
      String type1 = row.getString("type1");
      String type2 = row.getString("type2");
      int hp = row.getInt("hp");
      float attack = row.getFloat("attack");
      float defense = row.getFloat("defense");
      int speed = row.getInt("speed");
      String[] move_names = split( row.getString("move_names"), "," );
      int[] move_powers = int(split( row.getString("move_powers"), " " ));
      int[] move_accuracy = int(split( row.getString("move_accuracy"), " " ));
      String[] move_types = split( row.getString("move_types"), "," );
      player1Turn = true;

      //// TESTING:
      //println(name, "->", type1, "->", type2, "->", hp, "->", attack, "->", defense, "->", speed);
      //for(String i : move_names){
      //  println(i);
      //}

      // Load the pokemon image
      String image_id = name + ".png";
      pokemon_image = loadImage(image_id);
      pokemon_image.resize(0, 100);

      // Dynamicly adjust the grid 
      int x = counter % (int)sqrt(pokemonCount);
      int y = counter / (int)sqrt(pokemonCount);
      cards.add(new Card(250 + (150 * x), 125 + (y * 150), 100, 100, name, pokemon_image));
      pokemons.add(new Pokemon(width/2, height/2, name, type1, type2, hp, attack, defense, speed, pokemon_image, move_names, move_powers, move_accuracy, move_types));
      counter++;
    }
    randomPick = new Button(85, height-50, 130, 50, "Random Pick", color(131, 138, 112), color(195, 207, 161));
    player1_selection = new Button(75, height/2 - 70, 125, 125, "Player 1", color(131, 138, 112), color(131, 138, 112));
    player2_selection = new Button(width - 75, height/2 - 70, 125, 125, "Player 2", color(131, 138, 112), color(131, 138, 112));
  }

  void display() {
    image(background_img, 0, 0);
    for (Card a_card : cards) {
      a_card.display();
    }
    randomPick.display();
    if (player1Turn) {
      strokeWeight(10);
      stroke(color(0, 0, 255));
      rectMode(CENTER);
      rect(75, height/2 - 70, 125, 125);
      strokeWeight(1);
      stroke(0);
    } else {
      strokeWeight(10);
      stroke(color(255, 0, 0));
      rectMode(CENTER);
      rect(width - 75, height/2 - 70, 125, 125);
      strokeWeight(1);
      stroke(0);
    }
    
    // Display Pokemon Selections
    imageMode(CENTER);
    player1_selection.display();
    if (p1_pokemon != null) {image(p1_pokemon.image, 75, height/2 - 70);}
    player2_selection.display();
    if (p2_pokemon != null) {image(p2_pokemon.image, width - 75, height/2 - 70);}
    imageMode(CORNER);
    
  }
}
