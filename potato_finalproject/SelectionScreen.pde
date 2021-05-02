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
      String hp = row.getString("hp");
      
      println(name + " (" + type1 + ") HP: " + hp);
      
      int x = counter % 3;
      int y = counter / 3;
      cards.add(new Card(250 + (150 * x), 200 + (y * 150), 100, 100, name));
      pokemons.add( new Pokemon( new PVector(width/2, height/2) ) );
      counter++;
    }
    
  }

  void display() {
    for (Card a_card : cards) {
      a_card.display();
    }
  }
}
