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
    actualHealth = _actualHealth;
  }

  void display() {
    fill(255);
    rectMode(CENTER);
    rect(xLoc, yLoc, 90, 50, 7);
    fill(color(0, 255, 0));
    rectMode(CORNER);
    if ((80 - 80*(totalHealth - actualHealth)/totalHealth) <= (xLoc - 40)) {
      //health is 0
    } else {
      rect(xLoc - 40, yLoc + 10, 80 - 80*(totalHealth - actualHealth)/totalHealth, 10);
    }
    fill(0);
    textAlign(CENTER);
    text(pokeName, xLoc, yLoc);
  }
}
