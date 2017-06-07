import java.util.LinkedList;
import java.util.Collections;


SugarGrid myGrid;
LinkedList<Graph> list = new LinkedList<Graph>();
int inx = 22*20;
int iny = 0;
int wide = 20*10;
int tall = 20*5;


void setup(){
  size(1000,800);
  background(220);
  list.add(new AverageSugarLineGraph(inx, iny, wide, tall, "time", "sugar"));
  list.add(new WealthCDFGraph(inx, iny+tall+30, wide, tall, "time", "population", 30));
  myGrid = new SugarGrid(20,20,20, new SeasonalGrowbackRule(4, 1, 14, 20, 10*10));
  myGrid.addSugarBlob(5,5,1,8);
  
  Agent ag = new Agent(9,1,10, new SugarSeekingMovementRule());
  Agent bg = new Agent(9,1,10, new SugarSeekingMovementRule());
  myGrid.placeAgent(ag,5,5);
  myGrid.placeAgent(bg,2,2);
  myGrid.display();
  for(Graph update: list)
    update.update(myGrid);
  frameRate(6);
  
 
}
void draw(){
  //background(220);
  myGrid.update();
  for(Graph update: list)
    update.update(myGrid);
  myGrid.display();
  
 
}