class HealthBar {
  int xLoc, yLoc;
  int totalHealth, actualHealth;
  String pokeName;

  //Constructor
  HealthBar(int _x, int _y, int _totalHealth, String _pokeName) {
    xLoc = _x;
    yLoc = _y;
    totalHealth = _totalHealth;
    actualHealth = _totalHealth;
    pokeName = _pokeName;
  }

  void updateHealth(int _actualHealth) {
    actualHealth = max(actualHealth - _actualHealth, 0);
  }

  void display() {
    fill(255);
    rectMode(CENTER);
    rect(xLoc, yLoc, 90, 60, 7);
    fill(color(0, 255, 0));
    rectMode(CORNER);
    if (actualHealth > 0) {
      rect(xLoc - 40, yLoc, 80 - 80*(totalHealth - actualHealth)/totalHealth, 10);
    }
    fill(0);
    textSize(15);
    textAlign(CENTER);
    text(pokeName, xLoc, yLoc - 10);
    textSize(10);
    text(actualHealth + "/" + totalHealth, xLoc - 15, yLoc + 25);
  }
}
