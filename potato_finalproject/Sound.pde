class soundButton extends Button {
  boolean mute;
  PImage image;

  soundButton(float _xPos, float _yPos) {
    super(_xPos, _yPos, 20, 20, "Sound");
    mute = false;
    image = loadImage("Sound.png");
    image.resize(0, 20);
  }

  void muteSwitch() {
    if (mute) {
      mute = false;
    } else {
      mute = true;
    }
  }

  void display() {
    imageMode(CENTER);
    image(this.image, pos.x, pos.y);
    imageMode(CORNER);
    if (mute) {
      
    }
  }
}
