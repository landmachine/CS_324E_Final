Pokemon poke1;
Button button1;

int cardAmount = 9;
ArrayList<Card> cards;

void setup() {
  size(800, 800);
  
  // TESTING INITIALIZATIONS:
  poke1 = new Pokemon(new PVector(width/2, height/2) );
  button1 = new Button(100, 100, 75, 75, "BUTTON");
  //card1 = new Card(250, 250, 60, 60, "CARD");
  
  //create cards
  cards = new ArrayList<Card>();
  for (int i=0; i<cardAmount; i++){
    int x = i % 3;
    int y = i / 3;
    cards.add( new Card(250+(150*x), 200+(y*150), 100, 100, "CARD") );
  }
  
}


void draw() {
  background(222);
  
  
  //poke1.display();
  //button1.display();
  
  //display cards -- TODO: I will move it to selection
  for (Card a_card : cards){
    a_card.display();
  }
  
}
