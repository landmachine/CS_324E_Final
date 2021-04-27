class Pokemon {
  PVector pos;
  
  Pokemon(PVector _position){
    this.pos = _position;
  }
  
  void display(){
    fill(0);
    rect(pos.x, pos.y, 20, 20);
  }
}
