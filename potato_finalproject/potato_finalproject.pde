Pokemon p1;
Pokemon p2;
Button move1Button;
Button move2Button;
Button move3Button;
Button move4Button;

SelectionScreen screen1;
FightScreen screen2;

boolean firstScreen;

int cardAmount = 9;
ArrayList<Card> cards;

void setup() {
  size(800, 800);
  screen1 = new SelectionScreen();
  screen2 = new FightScreen();
  firstScreen = true;
}

void draw() {
  background(222);
  //add back in calls for screens - switching betwen them too
  if (firstScreen) {
    screen1.display();
  } else {
    screen2.display();
  }
}

void mousePressed() {
  if (firstScreen) {
    firstScreen = false;
  } else {
    firstScreen = true;
  }
}
