class SugarSeekingMovementRule implements MovementRule {
  
  Square newBig = null;
  double oneDist;
  double bigDist;
  
  public SugarSeekingMovementRule(){
  }
  
  public Square move(LinkedList<Square> neighbourhood, SugarGrid g, Square middle) { 
    Collections.shuffle(neighbourhood);
    for(int i = 0; i < neighbourhood.size(); i++){
       Square newOne = neighbourhood.get(i);
       if(newBig == null || newOne.getSugar() > newBig.getSugar())
         this.newBig = newOne;
       else if(newOne.getSugar() == newBig.getSugar()){
         oneDist = g.euclidianDistance(newOne, middle);
         bigDist = g.euclidianDistance(newBig, middle);
         if(oneDist < bigDist)
           this.newBig = newOne;
       }
       
    }
    return this.newBig;
  }
  
}


interface MovementRule{
  
  public Square move(LinkedList<Square> neighbourhood, SugarGrid g, Square middle);
  
}


class PollutionMovementRule implements MovementRule{
  
  Square newBest = null;
  double oneDist;
  double bigDist;
  
  public PollutionMovementRule(){
  }
   
  public Square move(LinkedList<Square> neighbourhood, SugarGrid g, Square middle) { 
    Collections.shuffle(neighbourhood);
    for(int i = 0; i < neighbourhood.size(); i++){
       Square newOne = neighbourhood.get(i);
       float oneSugar = newOne.getSugar(); float onePol = newOne.getPollution();
       float bestSugar = newBest.getSugar(); float bestPol = newBest.getPollution();
       if(newBest == null || oneSugar/onePol-onePol/onePol < bestSugar/bestPol-bestPol/bestPol )
         this.newBest = newOne;
       else if(oneSugar/onePol-onePol/onePol == bestSugar/bestPol-bestPol/bestPol){
         oneDist = g.euclidianDistance(newOne, middle);
         bigDist = g.euclidianDistance(newBest, middle);
         if(oneDist < bigDist)
           this.newBest = newOne;
       }
    }
    return this.newBest;
  }
  
}