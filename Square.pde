
class Square{
  
  int sugarLevel;
  int maxSugarLevel;
  int xcord;
  int ycord;
  Agent occupy;
  int pol;
  
  
  public Square(int sl, int slm, int x, int y){
    this.sugarLevel = sl;
    this.maxSugarLevel = slm;
    this.xcord = x;
    this.ycord = y;
    this.pol = 0;
  }
  
  public int getPollution(){
    return pol;
  }
  
  public int getX(){
    return xcord;
  }
  
  public int getY(){
    return ycord;
  }
  
  public int getSugar(){
    return sugarLevel;
  }
  
  public int getMaxSugar(){
    return maxSugarLevel; 
  }
  
  void setSugar(int desiredAmount){
    if(desiredAmount<0){desiredAmount = 0;}
    if(desiredAmount>maxSugarLevel){desiredAmount = maxSugarLevel;}
    sugarLevel = desiredAmount; 
  }
  
  public void setMaxSugar(int desiredAmount){
    if(desiredAmount < 0){desiredAmount = 0;}
    if(sugarLevel > desiredAmount){this.sugarLevel = desiredAmount;}
    this.maxSugarLevel = desiredAmount;
  }
  
  public Agent getAgent(){
   return this.occupy; 
  }
  
  public void setAgent(Agent a){
    if(occupy != null && a != null && occupy != a){assert(1==0);}
    this.occupy = a;
  }
  
  public void display(int size){
    stroke(255);
    strokeWeight(4);
    fill(255, 255, 255 - sugarLevel/6.0*255);
    rect(xcord, ycord, size, size);
    if(occupy != null)
       if(occupy.isAlive()==false){}
       else{
       occupy.display(xcord + size/2, ycord + size/2, size);
       }
  }
  
  
  public void setPollution(int level){
    this.pol = level;
  }


  
  
  
  
  
  
  
  
  
  
  
  
  
}