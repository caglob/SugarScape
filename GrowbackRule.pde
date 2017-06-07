class GrowbackRule implements GrowthRule{
  
  int growthRate;
  
  public GrowbackRule(int r){
    this.growthRate = r;
  }
  
  public void growBack(Square s){
      s.setSugar(s.getSugar() + growthRate);
  }
  
}

interface GrowthRule{
  
  public void growBack(Square s);
  
}


class SeasonalGrowbackRule implements GrowthRule{
  
  int a;
  int b;
  int g;
  int equ;
  int nSqu;
  int times = 0;
  boolean northSummer;
  int size;
  
  public SeasonalGrowbackRule(int alpha, int beta, int gamma, int equator, int numSquares){
    
    this.a = alpha;
    this.b = beta;
    this.g = gamma;
    this.equ = equator;
    this.nSqu = numSquares;
    northSummer = true;
    
  }
  
  
  public void growBack(Square s){
    if(times == 1)
      size = s.getX()+s.getY();
    boolean above = s.getY() <= (equ-1)*size;
    if(above == true){
      if(isNorthSummer())
        s.setSugar(s.getSugar() + a);
      else
        s.setSugar(s.getSugar() + b);
    }
    else{
      if(isNorthSummer())
        s.setSugar(s.getSugar() + b);
      else
        s.setSugar(s.getSugar() + a);
    }
    times++;
    if(times == g*nSqu){
      northSummer = !northSummer;
      times = 0;
    }
  }
  
  
  public boolean isNorthSummer(){
    return northSummer == true;
  }
  
  
  
}