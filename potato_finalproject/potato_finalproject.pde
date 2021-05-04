import processing.sound.*;

Pokemon p1_pokemon;
Pokemon p2_pokemon;

int pokemonCount;
ArrayList<Card> cards;
ArrayList<Pokemon> pokemons;

Timer time;
SelectionScreen screen_select;
FightScreen screen_fight;
boolean screenSwitched;

SoundFile selectionMusic;
SoundFile fightMusic;

void setup() {
  size(800, 800);
  
  // Loading screen
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("Loading....", width/2, height/2);

  // Load the music files
  selectionMusic = new SoundFile(this, "Ever_grande_city_8Bit.mp3");
  fightMusic = new SoundFile(this, "Guiles_theme.mp3");

  //// Create a Timer
  //time = new Timer(60);
  //time.pause();
  
  p1_pokemon = null;
  p2_pokemon = null;
  cards = new ArrayList<Card>();
  pokemons = new ArrayList<Pokemon>();
    
  //Initialize Screens
  screen_select = new SelectionScreen();
  screen_fight = new FightScreen();
  screenSwitched = false;

  // start the music
  selectionMusic.loop();

} 
  

void draw() {
    //if (time.isTime()){
      
    //add back in calls for screens - switching betwen them too
    if (!screenSwitched) {
      screen_select.display();
    } else {
      screen_fight.display();
    }
    
    //}

}


void mousePressed() {
  if (!screenSwitched){
    if (p1_pokemon == null){
      int index = 0;
      for (Card a_card : cards) {
        if (a_card.button.hover()){
          p1_pokemon = pokemons.get(index);
          p1_pokemon.pos = new PVector(width / 4, height / 2);
        }
        index++;
      }
    }else if (p2_pokemon == null){
      int index = 0;
      for (Card a_card : cards) {
        if (a_card.button.hover()){
          p2_pokemon = pokemons.get(index);
          p2_pokemon.pos = new PVector(3 * width / 4, height / 2);
        }
        index++;
      }
    }
    // If two pokemons have been selected switch to the other screen and change the music
    if (p1_pokemon != null && p2_pokemon != null){
      selectionMusic.stop();
      screen_fight.update_moves(); // update moves according to the pokemons
      screenSwitched = true; // switch to the fight screen
      fightMusic.loop();

    }
  }
  
  println("P1:", p1_pokemon, "P2:", p2_pokemon);
}
