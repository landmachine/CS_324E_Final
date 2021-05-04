class SelectionScreen {
  Table excel;
  PImage background_img;
  PImage pokemon_image;
  int card_size, card_space;
  
  Button randomPick;
  
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
      int attack = row.getInt("attack");
      int defense = row.getInt("defense");
      int speed = row.getInt("speed");
      String[] move_names = split( row.getString("move_names"), "," );
      int[] move_powers = int(split( row.getString("move_powers"), " " ));
      int[] move_accuracy = int(split( row.getString("move_accuracy"), " " ));
      String[] move_types = split( row.getString("move_types"), "," );
      
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

    
  }

  void display() {
    image(background_img, 0,0);
    for (Card a_card : cards) {
      a_card.display();
    }
    randomPick.display();
  }
  
}
