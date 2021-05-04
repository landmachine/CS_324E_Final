class Card {
  Button button;
  PVector pos;
  PVector size;
  String name;
  PImage image;

  //Constructor
  Card (float _xPos, float _yPos, float _xSize, float _ySize, String _name, PImage _image) {
    this.pos = new PVector(_xPos, _yPos);
    this.size = new PVector(_xSize, _ySize);
    this.name = _name;
    this.image = _image;
    this.button = new Button(pos.x, pos.y, size.x, size.y, "", color(131, 138, 112), color(195, 207, 161)); //195, 207, 161
  }

  void display() {
    stroke(3);
    strokeWeight(3);
    button.display();
    imageMode(CENTER);
    image(this.image, pos.x, pos.y);
    imageMode(CORNER);
  }
}
