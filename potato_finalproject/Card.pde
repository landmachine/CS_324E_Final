class Card {
  Button button;
  PVector pos;
  PVector size;
  String name;

  //Constructor
  Card (float _xPos, float _yPos, float _xSize, float _ySize, String _name) {
    this.pos = new PVector(_xPos, _yPos);
    this.size = new PVector(_xSize, _ySize);
    this.name = _name;
    this.button = new Button(pos.x, pos.y, size.x, size.y, name);
  }

  void display() {
    stroke(3);
    strokeWeight(3);
    button.display();
  }
}
