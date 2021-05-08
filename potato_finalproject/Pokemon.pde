class Pokemon {
  PVector pos;
  String name, type1, type2;
  int hp, speed;
  float attack, defense;
  PImage image;
  String[] move_names, move_types;
  int[] move_powers, move_accuracy;

  //Constructor
  Pokemon(float _posX, float _posY, String _name, String _type1, String _type2, int _hp, float _attack, float _defense, 
    int _speed, PImage _image, String[] _move_names, int[] _move_powers, int[] _move_accuracy, String[] _move_types) {
    this.pos = new PVector(_posX, _posY);
    this.name = _name;
    this.type1 = _type1;
    this.type2 = _type2;
    this.hp = _hp;
    this.attack = _attack;
    this.defense = _defense;
    this.speed = _speed;
    this.image = _image;
    this.move_names = _move_names;
    this.move_powers = _move_powers;
    this.move_accuracy = _move_accuracy;
    this.move_types = _move_types;
  }

  void display() {
    fill(0);
    image(this.image, pos.x, pos.y);
  }
}
