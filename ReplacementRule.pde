class ReplacementRule{
  
  
  int minA;
  int maxA;
  AgentFactory fac;
  LinkedList<Agent> listAgent = new LinkedList<Agent>();
  LinkedList<Integer> listAge = new LinkedList<Integer>();
  
  
  public ReplacementRule(int minAge, int maxAge, AgentFactory fac){
    this.minA = minAge;
    this.maxA = maxAge;
    this.fac = fac;
  }
  
  
  public boolean replaceThisOne(Agent a){
    boolean seen = false;
    boolean replace = false;
    for(int i = 0; i < listAgent.size(); i++){
      if(listAgent.get(i) == a){
         seen = true; 
         
         int currentAge = a.getAge();
         int currentLifespan = listAge.get(i);
         
         if(currentAge > currentLifespan){
           replace = true;
           a.setAge(maxA + 1);
         }
         
       break;}
    }
    
    if(seen == false){
      int lifespan = (int)random(minA, maxA);
      listAge.add(lifespan);
      listAgent.add(a);
    }
    
    if(a.isAlive() == false || replace == true)
      return true;
    else
      return false;
  }
  
  
  public Agent replace(Agent a, LinkedList<Agent> others){
    return fac.makeAgent();
  }
  
  
}