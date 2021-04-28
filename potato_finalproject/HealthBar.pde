class HealthBar {
  int xLoc, yLoc;
  int totalHealth, actualHealth;
  String pokeName;

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
    println(80 - 80*(totalHealth - actualHealth)/totalHealth);
    rect(width/2 - 40, height/2 + 10, 80 - 80*(totalHealth - actualHealth)/totalHealth, 10);
    fill(0);
    textAlign(CENTER);
    text("Pikachu", width/2, height/2 - 10);
  }
}