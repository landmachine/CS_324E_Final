class Button {
  PVector pos, size;
  PFont buttonFont;
  PShape buttonGraphic;
  String text;
  color c_hover = color(200);
  color c_static = color(100);

  // Standard hover/static colors
  Button(float _xPos, float _yPos, float _xLen, float _yLen, String _text) {
    pos = new PVector(_xPos, _yPos);
    size = new PVector(_xLen, _yLen);
    text = _text;
    buttonFont = createFont("SansSerif", 32);
    rectMode(CENTER);
    buttonGraphic = createShape(RECT, 0, 0, size.x, size.y);
  }

  //Change hover/statics colors
  Button(float _xPos, float _yPos, float _xLen, float _yLen, String _text, color _hover, color _static) {
    pos = new PVector(_xPos, _yPos);
    size = new PVector(_xLen, _yLen);
    text = _text;
    buttonFont = createFont("SansSerif", 32);
    rectMode(CENTER);
    buttonGraphic = createShape(RECT, 0, 0, size.x, size.y);
    c_hover = _hover;
    c_static = _static;
  }

  void display() {
    color col;
    if (hover()) {
      col = c_hover;
    } else {
      col = c_static;
    }
    buttonGraphic.setFill(col);
    shapeMode(CENTER);
    shape(buttonGraphic, pos.x, pos.y);
    textAlign(CENTER, CENTER);
    text(text, pos.x, pos.y-4);
  }

  boolean hover() {
    if ((mouseX > pos.x - size.x/2 && mouseX < pos.x + size.x/2) && 
      (mouseY > pos.y - size.y/2 && mouseY < pos.y + size.y/2)) {
      return true;
    }
    return false;
  }
}
