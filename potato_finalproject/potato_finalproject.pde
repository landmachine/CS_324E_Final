import processing.sound.*;

Table excel;
int pokemonCount;

Timer time;
SelectionScreen screen_select;
FightScreen screen_fight;
SoundFile selectionMusic;
SoundFile fightMusic;
boolean screenSwitched;

Pokemon p1_pokemon;
Pokemon p2_pokemon;

void setup() {
  size(800, 800);
  
  textSize(50);
  textAlign(CENTER);
  fill(0);
  text("Loading....", width/2, height/2);
  
  excel = loadTable("Pokemon.csv", "header");
  pokemonCount = excel.getRowCount();
  
  println("There are "+ pokemonCount +" pokemons in the table");
  
  //time = new Timer(60);
  //time.pause();
  screen_select = new SelectionScreen();
  screen_fight = new FightScreen();
  screenSwitched = false;
  
  selectionMusic = new SoundFile(this, "Ever Grande City 8Bit.mp3");
  fightMusic = new SoundFile(this, "GUILES THEME.mp3");
  selectionMusic.loop();
}

void draw() {
  //if (time.isTime()){
    background(222);
    //add back in calls for screens - switching betwen them too
    if (!screenSwitched) {
      screen_select.display();
    } else {
      screen_fight.display();
    }
  //}

}

void mousePressed() {
  if (screenSwitched) {
    fightMusic.stop();
    selectionMusic.loop();
    screenSwitched = false;
  } else {
    selectionMusic.stop();
    fightMusic.loop();
    screenSwitched = true;
  }
}
