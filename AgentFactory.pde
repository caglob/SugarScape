



class AgentFactory{
  
  int minMet;
  int maxMet;
  int minVis;
  int maxVis;
  int minInSug;
  int maxInSug;
  MovementRule m;
  
  public AgentFactory(int minMetabolism, int maxMetabolism, int minVision, 
          int maxVision, int minInitialSugar, int maxInitialSugar, MovementRule m){
           
     this.minMet = minMetabolism;
     this.maxMet = maxMetabolism;
     this.minVis = minVision;
     this.maxVis = maxVision;
     this.minInSug = minInitialSugar;
     this.maxInSug = maxInitialSugar;
     this.m = m;
            
  }
  
  public Agent makeAgent(){
    return new Agent((int)random(minMet, maxMet+1), (int)random(minVis, maxVis+1), (int)random(minInSug, maxInSug+1), m);
  }
  
  
  
}