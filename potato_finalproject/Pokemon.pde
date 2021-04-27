class Pokemon {
  PVector pos;
  int size = 50;
  
  Pokemon(PVector _position){
    this.pos = _position;
  }
  
  void display(){
    fill(0);
    rect(pos.x, pos.y, size, size);
  }
  
}
