class SelectionScreen {

  SelectionScreen() {
    cards = new ArrayList<Card>();
    for (int i = 0; i < cardAmount; i++) {
      int x = i % 3;
      int y = i / 3;
      cards.add(new Card(250 + (150 * x), 200 + (y * 150), 100, 100, "CARD"));
    }
  }

  void display() {
    for (Card a_card : cards) {
      a_card.display();
    }
  }
}
