class PollutionRule{
  
  
  int gathP;
  int eatP;
  
  
  public PollutionRule(int gatheringPollution, int eatingPollution){
    this.gathP = gatheringPollution;
    this.eatP = eatingPollution;
  }
  
  
  public void pollute(Square s){
    Agent a;
    if(s.getAgent() == null){}
    else{
      a = s.getAgent();
      s.setPollution(s.getPollution() + a.getMetabolism()*eatP + s.getSugar()*gathP);   
    }
  }
  
  
}