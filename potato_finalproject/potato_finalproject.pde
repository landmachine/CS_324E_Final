Table excel;
int pokemonCount;

Timer time;
SelectionScreen screen_select;
FightScreen screen_fight;
boolean screenSwitched;

Pokemon p1;
Pokemon p2;

void setup() {
  size(800, 800);
  
  excel = loadTable("Pokemon.csv", "header");
  pokemonCount = excel.getRowCount();
  
  println("There are "+ pokemonCount +" pokemons in the table");
  
  //time = new Timer(60);
  //time.pause();
  screen_select = new SelectionScreen();
  screen_fight = new FightScreen();
  screenSwitched = false;
  
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
    screenSwitched = false;
  } else {
    screenSwitched = true;
  }
}
