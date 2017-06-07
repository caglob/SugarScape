class SquareTester{
  
  void test(){
    
    /*
    
   Square s = new Square(6, 7, 250, 250);
   assert(s.getSugar() == 6);
   assert(s.getMaxSugar() == 7);
   s.setSugar(12);
   assert(s.getSugar() == 7);
   s.setMaxSugar(-3);
   assert(s.getMaxSugar() == 0);
   assert(s.getX() == 250);
   assert(s.getY() == 250);
   s.setAgent(null);
   assert(s.getAgent() == null);
   assert(s.getSugar() == 0);
   //s.display(15);
   //assert();
   //Square b = new Square(4, 100, 200, 200);
   //b.display(15);
    
    
    
    
    //Q2
    
    s.setSugar(2);
    s.setMaxSugar(30);
    GrowbackRule l = new GrowbackRule(2); 
    l.growBack(s);
   // assert(s.getSugar()==30);
    
    
    
    
    //Q3
    
    Square d1 = new Square(0, 0, 10,10);
    Square d2 = new Square(0, 0, 10, 9);
    GrowbackRule law = new GrowbackRule(3);
    SugarGrid comedy = new SugarGrid(20, 20, 15, law);
    MovementRule yepp = new MovementRule();
    Agent heyy = new Agent(0, 0, 1, yepp);
    assert(comedy.getWidth()==20);
    assert(comedy.getHeight()==20);
    assert(comedy.getSquareSize()==15);
    assert(comedy.getSugarAt(1, 10) == 0);
    assert(comedy.getAgentAt(10, 20) == null);
    assert(comedy.getMaxSugarAt(20, 10) == 0);
    comedy.placeAgent(heyy, 20, 10);
    assert(comedy.getAgentAt(20, 10) == heyy);
    assert(comedy.getAgentAt(19, 10) == null);
    //comedy.placeAgent(heyy, 20, 10);                // should crash
    //SugarGrid distance = new SugarGrid(20, 20, 2, law);
    //print(distance.euclidianDistance(d1, d2));
    //comedy.addSugarBlob(10, 20, 1, 4);
    comedy.addSugarBlob(10, 10, 1, 6);
    //comedy.addSugarBlob(17, 17, 1, 8);
    //System.out.println(comedy.getMaxSugarAt(1,1));
    //System.out.println(comedy.getMaxSugarAt(9,9));
    //System.out.println(comedy.getMaxSugarAt(15,15));
    comedy.display();
    //assert(1==0);
    int num = 0;
    int val = 10;
    int i = 0;
    int wind = -1; 
    int x = 1;
    Square test;
    LinkedList<Square> anx = comedy.generateVision(10, 10, x);
    
    
    
    Agent ad = new Agent(1, 1, 10, new MovementRule());
    comedy.placeAgent(ad, 10, 10);
    comedy.display();
    
    
    
    //Q4
    
    Square other = new Square(4, 9, 160, 160);
    Square hoyy = new Square(5, 11, 34, 34); 
    MovementRule h = new MovementRule();
    Agent r = new Agent(5, 7, 43, h);
    Agent n = new Agent(3, 4, 40, h);
    assert(n.getMetabolism() == 3);
    assert(n.getVision() == 4);
    assert(n.getSugarLevel()==40);
    assert(n.getMovementRule()==h);
    s.setAgent(n);
    assert(s.getAgent() == n);
    n.move(s, other);
    assert(other.getAgent() == n);
    //other.setAgent(r);            // should crash
    //n.step();
    //assert(n.isAlive()==false);
    //assert(n.isAlive()==true);
    n.eat(other);
    assert(other.getSugar() == 0);
    assert(n.getSugarLevel() == 44);
    
    
    */
    
    // A5 Q3
   
   
   
   Agent a = new Agent(1, 1, 1, new SugarSeekingMovementRule());
   assert(a.getAge() == 0);
   a.setAge(3);
   assert(a.getAge() == 3);
   Agent dead = new Agent(1, 1, 0, new SugarSeekingMovementRule());
   AgentFactory firstAF = new AgentFactory(2, 9, 1, 3, 5, 10, new SugarSeekingMovementRule());
   ReplacementRule firstRR = new ReplacementRule(2, 6, firstAF);
   assert(dead.isAlive() == false);
   assert(firstRR.replaceThisOne(dead)==true);
   a.setAge(30);
   assert(firstRR.replaceThisOne(a)==false);
   int ageOfa = a.getAge();
   //assert(ageOfa >= 2 && ageOfa <=6);
   //a.setAge(30);
   //a = dead;
   //assert(firstRR.replaceThisOne(a) == true);
   a.setAge(30);
   assert(firstRR.replaceThisOne(a) == true);
   ageOfa = a.getAge();
   assert(ageOfa == 7);
   LinkedList<Agent> list = new LinkedList<Agent>();
   Agent b = firstRR.replace(a, list);
   SeasonalGrowbackRule hev = new SeasonalGrowbackRule(2, 1, 1, 20, 20);
   
   SugarGrid s = new SugarGrid(40, 40, 15, hev);
   s.addSugarBlob(20, 20, 50, 10);
   assert(s.getSugarAt(10, 10)==10);
   assert(s.getSugarAt(30, 30)==10);
   
   
   
     
   
   
   
   
   
   
   
   
   
   
    
    
    
    
    print("done!");
  }
  
}