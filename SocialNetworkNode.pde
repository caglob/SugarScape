class SocialNetworkNode{
  
  Agent a;
  Boolean painted;
  
  public SocialNetworkNode(Agent a){
    
    this.a = a;
    this.painted = false;
    
  }
  
  
  public boolean painted(){
    return painted;
  }
  
  
  public void paint(){
    this.painted = true;
  }
  
  
  public void unpaint(){
    this.painted = false;
  }
  
  
  public Agent getAgent(){
    return a;
  }
  
  
  
}



class SocialNetwork{
  
  public SocialNetwork(SugarGrid g){
    
  }
  
  public boolean adjacent(SocialNetworkNode x, SocialNetworkNode y){
    return true;
  }
  
  public LinkedList<SocialNetworkNode> seenBy(SocialNetworkNode x){
    return null;
  }
  
  public LinkedList<SocialNetworkNode> sees(SocialNetworkNode y){
    return null;
  }
  
  public void resetPaint(){
  }
  
  public SocialNetworkNode getNode(Agent a){
    return null;
  }
  
}