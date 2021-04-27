class Button {
  PVector pos, size;
  PFont buttonFont;
  PShape buttonGraphic;
  String displayText;

  Button(int _xPos, int _yPos, int _xLen, int _yLen, String _displayText) {
    pos = new PVector(_xPos, _yPos);
    size = new PVector(_xLen, _yLen);
    displayText = _displayText;
    buttonFont = createFont("SansSerif", 32);
    rectMode(CENTER);
    buttonGraphic = createShape(RECT, 0, 0, size.x, size.y);
  }

  void display() {
    color col;
    if (hover()) {
      col = color(100); //hover color
    } else {
      col = color(150); // static color
    }
    buttonGraphic.setFill(col);
    shapeMode(CENTER);
    shape(buttonGraphic, pos.x, pos.y);
    textAlign(CENTER, CENTER);
    text(displayText, pos.x, pos.y-4);
  }

  boolean hover() {
    if ((mouseX > pos.x - size.x/2 && mouseX < pos.x + size.x/2) && 
      (mouseY > pos.y - size.y/2 && mouseY < pos.y + size.y/2)) {
      return true;
    }
    return false;
  }
}
