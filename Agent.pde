import java.lang.Throwable;


class Agent {
  
  int metab;
  int vision;
  int sugarLevel;
  MovementRule m;
  int age;
  
  public Agent(int m, int v, int sl, MovementRule mr){
    this.metab = m;
    this.vision = v;
    this.sugarLevel = sl;
    this.m = mr;
    this.age = 0;
  }
  
  public int getMetabolism() {
    return metab;
  }
  
  public int getVision() {
    return vision;
  }
  
  public int getSugarLevel() {
    return sugarLevel;
  }
  
  public MovementRule getMovementRule() {
    return m;
  }
  
  public void move(Square source, Square dest) {
    if(dest.getAgent() != null && source != dest){
      assert(1==0);
    }
    if(source == dest){}
    else{
    dest.setAgent(source.getAgent());
    source.setAgent(null);
    }
  }
  
  public void step() {
    this.sugarLevel = sugarLevel - metab;
    if(sugarLevel < 0){sugarLevel = 0;}
    age++;
  }
  
  public boolean isAlive() {
    if(sugarLevel > 0){return true;}
    else{return false;}
  }
  
  public void eat(Square s) {
    this.sugarLevel += s.getSugar();
    s.setSugar(0);
  }
  
  public void display(int x, int y, int scale) {
    fill(0);
    ellipse(x, y, 3*scale/4, 3*scale/4);
    
  }
  
  public int getAge(){
    return age;
  }
  
  public void setAge(int howOld){
    assert(howOld >= 0);
    this.age = howOld;
  }
  
}
  
  
  
  
  
  