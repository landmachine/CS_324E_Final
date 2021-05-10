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

pauseButton pauseControl;

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

  p1_pokemon = null;
  p2_pokemon = null;
  cards = new ArrayList<Card>();
  pokemons = new ArrayList<Pokemon>();

  //Initialize Screens
  screen_select = new SelectionScreen();
  screen_fight = new FightScreen();
  screenSwitched = false;

  pauseControl = new pauseButton(width - 30, 80);
} 

void draw() {
  if (!pauseControl.paused) {
    if (initializeMusic) {
      // Load the music files
      selectionMusic = new SoundFile(this, "Ever_grande_city_8Bit.mp3");
      fightMusic = new SoundFile(this, "Guiles_theme.mp3");

      // start the music
      selectionMusic.amp(.3);
      selectionMusic.play();
      fightMusic.amp(.2);
      initializeMusic = false;
    }
    //add back in calls for screens - switching betwen them too
    if (!screenSwitched) {
      screen_select.display();
      if (!selectionMusic.isPlaying()) {
        selectionMusic.loop();
      }
    } else {
      screen_fight.display();
      if (!fightMusic.isPlaying()) {
        fightMusic.loop();
      }
    }
    soundControl.display();
  }
  pauseControl.display();
}


void mousePressed() {
  // Mute Sound Button
  if (pauseControl.hover()) {
    if (!pauseControl.paused) {
      if (!screenSwitched) {
        selectionMusic.pause();
      } else {
        fightMusic.pause();
      }
      pauseControl.paused = true;
    } else {
        if (!screenSwitched) {
        selectionMusic.play();
      } else {
        fightMusic.play();
      }
      pauseControl.paused = false;
    }
  }
  if (soundControl.hover() && !pauseControl.paused) {
    soundControl.muteSwitch();
  }

  // Differentiate screens for different buttons
  if (!screenSwitched && !pauseControl.paused) { //SELECTION SCREEN

    if (screen_select.player1Turn) {
      int index = 0;
      for (Card a_card : cards) {
        if (a_card.button.hover()) {
          p1_pokemon = pokemons.get(index).clone();
          screen_fight.p1Health = new HealthBar(width/2 - 200, height/2 - 200, p1_pokemon.hp, "Player1");
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
          screen_fight.p2Health = new HealthBar(width/2 + 200, height/2 - 200, p2_pokemon.hp, "Player2");
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
      fightMusic.play();
    }


  }//SELECTION SCREEN END

  else if (screenSwitched && !pauseControl.paused) { //FIGHT SCREEN
    int index = 0;
    for (Button a_move : screen_fight.p1Moves) {
      if (a_move.hover()) {
        screen_fight.p1choice = index;
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
        delay(250);// 0.25 seconds -> (?)
        p1_pokemon.display();
      }
      index++;
    }
    
  }//FIGHT SCREEN END
}


void keyPressed() {

  // Pause the game
  if (key == 'p') {
    if (!pauseControl.paused) {
      if (!screenSwitched) {
        selectionMusic.pause();
      } else {
        fightMusic.pause();
      }
      pauseControl.paused = true;
    } else {
      if (!screenSwitched) {
        selectionMusic.play();
      } else {
        fightMusic.play();
      }
      pauseControl.paused = false;
    }
  }
  // Differentiate screens for different key strokes
  if (!screenSwitched) { //SELECTION SCREEN
    // Nothing required for now...
    
  }//SELECTION SCREEN END

  else { //FIGHT SCREEN

    // FIXME: We should connect these keystrokes to their corresponding buttons/moves
    // ----------------------------------------------------------------------------------
    if (screen_fight.player1Turn) { // Checks who's turn it is
      // Player-1 Moves => "a, s, d, f"
      if (key == 'a') {
        println(key);
      }
      if (key == 's') {
        println(key);
      }
      if (key == 'd') {
        println(key);
      }
      if (key == 'f') {
        println(key);
      }
    } else {
      // Player-2 Moves => "j, k, l, ;"
      if (key == 'j') {
        println(key);
      }
      if (key == 'k') {
        println(key);
      }
      if (key == 'l') {
        println(key);
      }
      if (key == ';') {
        println(key);
      }
    } 
    // ----------------------------------------------------------------------------------
    
  }//FIGHT SCREEN END



  // Press "R" to restart the game
  if (key=='r') {
    setup();
  }
}
