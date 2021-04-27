Pokemon poke1;
Button button1;

void setup() {
  size(800, 800);
  
  // TESTING INITIALIZATIONS:
  poke1 = new Pokemon(new PVector(width/2, height/2) );
  button1 = new Button(100, 100, 75, 75, "BUTTON");
}


void draw() {
  background(100);
  
  
  poke1.display_card();
  button1.display();
  
}
