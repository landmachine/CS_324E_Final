import processing.sound.*;

Pokemon p1_pokemon;
Pokemon p2_pokemon;

int pokemonCount;
ArrayList<Card> cards;
ArrayList<Pokemon> pokemons;

SelectionScreen screen_select;
FightScreen screen_fight;
EndScreen screen_end;
boolean screenSwitched;
boolean gameOver;
boolean p1victory;

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
  text("Loading", width/2, height/2);
  PImage load = loadImage("loading.gif");
  image(load, 0, 0);

  //set sound variables
  initializeMusic = true;
  soundControl = new soundButton(width - 30, 30);
  pauseControl = new pauseButton(30, 30);

  p1_pokemon = null;
  p2_pokemon = null;
  cards = new ArrayList<Card>();
  pokemons = new ArrayList<Pokemon>();

  //Initialize Screens
  screen_select = new SelectionScreen();
  screen_fight = new FightScreen();
  //screen_end = new EndScreen();
  screenSwitched = false;
  gameOver = false;
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
    } else if (gameOver) {
      screen_end.display();
      screen_end.move();
    } else {
      screen_fight.display();
      if (screen_fight.p1Health.actualHealth == 0 || screen_fight.p2Health.actualHealth == 0) {
        gameOver = true;
        if (screen_fight.p1Health.actualHealth == 0 && screen_fight.p2Health.actualHealth == 0) {
          if (p1_pokemon.speed > p2_pokemon.speed) {
            p1victory = true;
          } else {
            p1victory = false;
          }
        } else if (screen_fight.p1Health.actualHealth == 0) {
          p1victory = false;
        } else {
          p1victory = true;
        }
      }
      screen_end = new EndScreen();
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
    if (screen_fight.p1choice == -1) {
      for (Button a_move : screen_fight.p1Moves) {
        if (a_move.hover()) {
          screen_fight.p1choice = index;
        }
        index++;
      }
    } else {
      for (Button a_move : screen_fight.p2Moves) {
        if (a_move.hover()) {
          screen_fight.p2choice = index;
        }
        index++;
      }
    }
  }//FIGHT SCREEN END

  //END SCREEN
  if (gameOver) {
    if (screen_end.restart.hover()) {
      fightMusic.stop();
      setup();
    }
    if (screen_end.quit.hover()) {
      exit();
    }
  }
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
        screen_fight.p1choice = 0;
      }
      if (key == 's') {
        screen_fight.p1choice = 1;
      }
      if (key == 'd') {
        screen_fight.p1choice = 2;
      }
      if (key == 'f') {
        screen_fight.p1choice = 3;
      }
    } else {
      // Player-2 Moves => "j, k, l, ;"
      if (key == 'j') {
        screen_fight.p2choice = 0;
      }
      if (key == 'k') {
        screen_fight.p2choice = 1;
      }
      if (key == 'l') {
        screen_fight.p2choice = 2;
      }
      if (key == ';') {
        screen_fight.p2choice = 3;
      }
    } 
    // ----------------------------------------------------------------------------------
  }//FIGHT SCREEN END
}
