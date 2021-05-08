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

soundButton soundControl;
SoundFile selectionMusic;
SoundFile fightMusic;

boolean initializeMusic;

color player1;
color player2;

void setup() {
  size(800, 800);

  // Loading screen
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("Loading....", width/2, height/2);

  //set sound variables
  initializeMusic = true;
  soundControl = new soundButton(width - 30, 30);

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
} 


void draw() {
  if (initializeMusic) {
    // Load the music files
    selectionMusic = new SoundFile(this, "Ever_grande_city_8Bit.mp3");
    fightMusic = new SoundFile(this, "Guiles_theme.mp3");

    // start the music
    selectionMusic.amp(.3);
    selectionMusic.loop();
    fightMusic.amp(.2);
    initializeMusic = false;
  }
  //if (time.isTime()){
  //add back in calls for screens - switching betwen them too
  if (!screenSwitched) {
    screen_select.display();
  } else {
    screen_fight.display();
  }
  soundControl.display();

  //}
}


void mousePressed() {
  if (soundControl.hover()) {
    soundControl.muteSwitch();
  }
  if (!screenSwitched) {
    if (screen_select.player1Turn) {
      int index = 0;
      for (Card a_card : cards) {
        if (a_card.button.hover()) {
          p1_pokemon = pokemons.get(index);
          p1_pokemon.pos = new PVector(width / 4, height / 2);
        }
        index++;
      }
    } else if (!screen_select.player1Turn) {
      int index = 0;
      for (Card a_card : cards) {
        if (a_card.button.hover()) {
          p2_pokemon = pokemons.get(index);
          p2_pokemon.pos = new PVector(3 * width / 4, height / 2);
        }
        index++;
      }
    }
    if (screen_select.player1.hover()) {
      screen_select.player1Turn = true;
    } else if (screen_select.player2.hover()) {
      screen_select.player1Turn = false;
    }
    // If two pokemons have been selected switch to the other screen and change the music
    if (p1_pokemon != null && p2_pokemon != null) {
      selectionMusic.stop();
      screen_fight.update_moves(); // update moves according to the pokemon
      screenSwitched = true; // switch to the fight screen
      fightMusic.loop();
    }
  } else {
    int index = 0;
    for (Button a_move : screen_fight.p1Moves) {
      if (a_move.hover()) {
        screen_fight.p1choice = index;
        tint(255, 0, 0, 127);
        p2_pokemon.display();
        delay(250);
        noTint();
        p2_pokemon.display();
      }
      index++;
    }
    index = 0;
    for (Button a_move : screen_fight.p2Moves) {
      if (a_move.hover()) {
        screen_fight.p2choice = index;
        tint(255, 0, 0, 127);
        p1_pokemon.display();
        noTint();
        delay(250);
        p1_pokemon.display();
      }
      index++;
    }
  }

  println("P1:", p1_pokemon, "P2:", p2_pokemon);
}
