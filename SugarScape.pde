import java.util.LinkedList;
import java.util.Collections;


SugarGrid myGrid;
LinkedList<Graph> list = new LinkedList<Graph>();
int inx = 52*10;
int iny = 0;
int wide = 20*10;
int tall = 20*5;


void setup(){
  size(1000,800);
  background(220);
  list.add(new AverageSugarLineGraph(inx, iny, wide, tall, "time", "sugar"));
  //list.add(new WealthCDFGraph(inx, iny+tall+30, wide, tall, "time", "population", 2));
  myGrid = new SugarGrid(50,50,10, new SeasonalGrowbackRule(4, 0, 10, 50, 25*25));
  myGrid.addSugarBlob(25,25,3,8);
  
  AgentFactory a = new AgentFactory(1, 9, 1, 3, 2, 20, new SugarSeekingMovementRule());
  Agent na = new Agent(5, 2, 10,new SugarSeekingMovementRule()); myGrid.placeAgent(na, (int)random(1, 25), (int)random(1, 25));
  Agent nb = new Agent(5, 2, 10,new SugarSeekingMovementRule()); myGrid.placeAgent(nb, (int)random(1, 25), (int)random(1, 25));
  Agent nc = new Agent(5, 2, 10,new SugarSeekingMovementRule()); myGrid.placeAgent(nc, (int)random(1, 25), (int)random(1, 25));
  Agent nd = new Agent(5, 2, 10,new SugarSeekingMovementRule()); myGrid.placeAgent(nd, (int)random(1, 25), (int)random(1, 25));
  Agent ne = new Agent(5, 2, 10,new SugarSeekingMovementRule()); myGrid.placeAgent(ne, (int)random(1, 25), (int)random(1, 25));
  
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