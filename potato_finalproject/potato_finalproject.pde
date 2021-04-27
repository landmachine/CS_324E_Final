Pokemon poke1;


void setup() {
  size(800, 800);
  
  poke1 = new Pokemon(new PVector(width/2, height/2) );
}


void draw() {
  background(100);
  
  poke1.display();
  
}
