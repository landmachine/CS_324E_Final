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

color player1_color;
color player2_color;

void setup() {
  size(800, 800);

  // Loading screen
  fill(0);
  textSize(50);
  textAlign(CENTER);
  text("Loading...", width/2, height/2);

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
  // Mute Sound Button
  if (soundControl.hover()) {
    soundControl.muteSwitch();
  }
  
  // Differentiate screens for different buttons
  if (!screenSwitched) { //SELECTION SCREEN
  
    if (screen_select.player1Turn) {
      int index = 0;
      for (Card a_card : cards) {
        if (a_card.button.hover()) {
          p1_pokemon = pokemons.get(index).clone();
          p1_pokemon.pos = new PVector(width / 4, height / 2);
          
          screen_select.player1Turn = false;
        }
        index++;
      }
    } else if (!screen_select.player1Turn) {
      int index = 0;
      for (Card a_card : cards) {
        if (a_card.button.hover()) {
          p2_pokemon = pokemons.get(index).clone();
          p2_pokemon.pos = new PVector(3 * width / 4, height / 2);
          
          screen_select.player1Turn = true;
        }
        index++;
      }
    }
    
    // Allow players to change turns
    if (screen_select.player1_selection.hover()) {
      screen_select.player1Turn = true;
    } else if (screen_select.player2_selection.hover()) {
      screen_select.player1Turn = false;
    }
    
    // If two pokemons have been selected switch to the other screen and change the music
    if (p1_pokemon != null && p2_pokemon != null) {
      selectionMusic.stop();
      screen_fight.update_moves(); // update moves according to the pokemon
      screenSwitched = true; // switch to the fight screen
      fightMusic.loop();
    }
    
  }//SELECTION SCREEN END
  
  else { //FIGHT SCREEN
  
    int index = 0;
    for (Button a_move : screen_fight.p1Moves) {
      if (a_move.hover()) {
        screen_fight.p1choice = index;
        // start move stuff
        if (p1_pokemon.move_types[screen_fight.p1choice].equals("Electric")) {
          println("move is electric type");
        } else if (p1_pokemon.move_types[screen_fight.p1choice].equals("Normal")) {
          println("move is normal type");
        } else if (p1_pokemon.move_types[screen_fight.p1choice].equals("Grass")) {
          println("move is grass type");
        } else if (p1_pokemon.move_types[screen_fight.p1choice].equals("Fire")) {
          println("move is fire type");
        } else if (p1_pokemon.move_types[screen_fight.p1choice].equals("Dragon")) {
          println("move is dragon type");
        } else if (p1_pokemon.move_types[screen_fight.p1choice].equals("Water")) {
          println("move is water type");
        } else if (p1_pokemon.move_types[screen_fight.p1choice].equals("Dark")) {
          println("move is dark type");
        } else if (p1_pokemon.move_types[screen_fight.p1choice].equals("Psychic")) {
          println("move is psychic type");
        } else if (p1_pokemon.move_types[screen_fight.p1choice].equals("Poison")) {
          println("move is poison type");
        } else if (p1_pokemon.move_types[screen_fight.p1choice].equals("Fairy")) {
          println("move is fairy type");
        } else {
          println("ya done goofed. move type not recognized");
        }
        tint(255, 0, 0, 127);
        p2_pokemon.display();
        noTint();
        p2_pokemon.display();
        // end move stuff
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
    
  }//FIGHT SCREEN END

  //testing pokemon selection
  if (p1_pokemon != null){print("P1:", p1_pokemon.name, "  ");}else{print("P1:", p1_pokemon, "  ");}
  if (p2_pokemon != null){println("P2:", p2_pokemon.name);}else{println("P2:", p2_pokemon);}
}
