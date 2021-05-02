class SelectionScreen {
  ArrayList<Card> cards;
  ArrayList<Pokemon> pokemons;
  
  SelectionScreen() {
    cards = new ArrayList<Card>();
    pokemons = new ArrayList<Pokemon>();
    
    //initialize Cards and Pokemons using the data that is extracted from a excel file
    int counter = 0;
    for (TableRow row : excel.rows()) {
      String name = row.getString("name");
      String type1 = row.getString("type1");
      String type2 = row.getString("type2");
      int hp = row.getInt("hp");
      int attack = row.getInt("attack");
      
      println(name, "->", type1, "->", type2, "->", hp, "->", attack);
      
      int x = counter % 3;
      int y = counter / 3;
      cards.add(new Card(250 + (150 * x), 125 + (y * 150), 100, 100, name));
      pokemons.add(new Pokemon(width/2, height/2, name, type1, type2, hp, attack));
      counter++;
    }
    
    p1_pokemon = pokemons.get(0);
    p2_pokemon = pokemons.get(1);
    
  }

  void display() {
    for (Card a_card : cards) {
      a_card.display();
    }
  }
}
