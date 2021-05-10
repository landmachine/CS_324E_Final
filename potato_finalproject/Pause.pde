class pauseButton extends Button {
  boolean paused;
  PImage image;

  pauseButton(float _xPos, float _yPos) {
    super(_xPos, _yPos, 40, 40, "Pause");
    paused = false;
  }

  void display() {
    triangle(pos.x - 15, pos.y + 15, pos.x + 15, pos.y, pos.x - 15, pos.y - 15);
    if (paused) {
      stroke(color(255, 0, 0));
      strokeWeight(3);
      line(pos.x - 10, pos.y - 10, pos.x + 10, pos.y + 10);
      line(pos.x + 10, pos.y - 10, pos.x - 10, pos.y + 10);
      stroke(0);
      strokeWeight(1);
    }
  }
}
