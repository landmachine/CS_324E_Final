class Pokemon {
  PVector pos;
  String name, type1, type2;
  int hp, attack;

  Pokemon(float _posX, float _posY, String _name, String _type1, String _type2, int _hp, int _attack) {
    this.pos = new PVector(_posX, _posY);
    this.name = _name;
    this.type1 = _type1;
    this.type2 = _type2;
    this.hp = _hp;
    this.attack = _attack;
  }

  void display() {
    fill(0);
    rectMode(CENTER);
    rect(pos.x, pos.y, 128, 128);
  }

}
