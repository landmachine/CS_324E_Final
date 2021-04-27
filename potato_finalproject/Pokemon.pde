class Pokemon {
  PVector pos;
  int card_size = 50;
  
  Pokemon(PVector _position){
    this.pos = _position;
  }
  
  void display(){
    fill(0);
    rect(pos.x, pos.y, 20, 20);
  }
  
  void display_card(){
    fill(255);
    rect(pos.x, pos.y, card_size, card_size);
  }
}
