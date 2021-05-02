class Pokemon {
  PVector pos;
  int card_size = 50;

  Pokemon(PVector _position) {
    this.pos = _position;
  }

  void display() {
    fill(0);
    rectMode(CENTER);
    rect(pos.x, pos.y, 128, 128);
  }

}
