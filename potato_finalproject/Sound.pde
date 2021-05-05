class soundButton extends Button {
  boolean mute;
  PImage image;

  soundButton(float _xPos, float _yPos) {
    super(_xPos, _yPos, 40, 40, "Sound");
    mute = false;
    image = loadImage("Sound.png");
    image.resize(0, 40);
  }

  void muteSwitch() {
    if (mute) {
      selectionMusic.amp(.30);
      fightMusic.amp(0.25);
      mute = false;
    } else {
      selectionMusic.amp(0);
      fightMusic.amp(0);
      mute = true;
    }
  }

  void display() {
    imageMode(CENTER);
    image(this.image, pos.x, pos.y);
    imageMode(CORNER);
    if (mute) {
      stroke(color(255, 0, 0));
      strokeWeight(3);
      line(pos.x - 10, pos.y - 10, pos.x + 10, pos.y + 10);
      line(pos.x + 10, pos.y - 10, pos.x - 10, pos.y + 10);
      stroke(0);
      strokeWeight(1);
    }
  }
}
