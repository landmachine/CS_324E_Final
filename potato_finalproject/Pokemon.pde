class Pokemon {
  PVector pos;
  String name, type1, type2;
  int hp, attack;
  PImage image;
  
  Pokemon(float _posX, float _posY, String _name, String _type1, String _type2, int _hp, int _attack, PImage _image) {
    this.pos = new PVector(_posX, _posY);
    this.name = _name;
    this.type1 = _type1;
    this.type2 = _type2;
    this.hp = _hp;
    this.attack = _attack;
    this.image = _image;
  }

  void display() {
    fill(0);
    rectMode(CENTER);
    rect(pos.x, pos.y, 128, 128);
    image(this.image, pos.x, pos.y);
  }

}
