
class SugarGrid {
  
  int wid;
  int hei;
  int len;
  GrowthRule GrowbackRule;
  Square[] row;
  Square[][] column;
  //int j = 0;
  //int ynum = 0;
  LinkedList<Square> used = new LinkedList<Square>();

  
  public SugarGrid(int w, int h, int sideLen, GrowthRule g) {
    this.wid = w;
    this.hei = h;
    this.len = sideLen;
    this.GrowbackRule = g;
    row = new Square[wid];
    column = new Square[hei][wid];
    for(int j = 0; j < hei; j++){
      for(int i = 0; i < wid; i++){
        row[i] = new Square(0, 0, i*len, j*len);
      }
      column[j] = row;
      row = new Square[wid];
    }
  }
  
  public int getWidth() {
    return wid;
  }
  
  public int getHeight() {
    return hei;
  }
  
  public int getSquareSize() {
    return len;
  }
  
  public int getSugarAt(int i, int j) {
    Square[] getRow = column[j-1];
    Square getSquare = getRow[i-1];
    return getSquare.getSugar();
  }
  
  public int getMaxSugarAt(int i, int j) {
    Square[] getRow = column[j-1];
    Square getSquare = getRow[i-1];
    return getSquare.getMaxSugar();
  }
  
  public Agent getAgentAt(int i, int j) {
    Square[] getRow = column[j-1];
    Square getSquare = getRow[i-1];
    return getSquare.getAgent();
  }
  
  public void addSugarBlob(int x, int y, int radius, int maximum) {
    Square[] getCenterRow = column[y-1];
    Square center = getCenterRow[x-1];
    int YrCount = 0;
    int XrCount = 0;
    int max;
    int loc;
    int d;
    while(YrCount < hei){
      while(XrCount < wid){
        Square[] getRow = column[YrCount];
        Square getSquare = getRow[XrCount];
        d = (int)euclidianDistance(center, getSquare); d=d/len; 
        loc = d/radius;
        max = maximum - loc;
        if(getSquare.getSugar() <= max && max >= 0){
          getSquare.setMaxSugar(max);
          getSquare.setSugar(max);  
        }
        getRow[XrCount] = getSquare;
        column[YrCount] = getRow;
        XrCount++;
      }
      YrCount++;
      XrCount = 0;
    }
  }
  
    
  
  public double euclidianDistance(Square a, Square b) {
    double xa = a.getX(); double xb = b.getX();
    double ya = a.getY(); double yb = b.getY();
    double xd; double yd;
    xd = abs((float)(xa-xb));
    yd = abs((float)(ya-yb));
    if(xd/len > wid/2)
      xd -= wid*len;
    if(yd/len > hei/2)
      yd -= hei*len;
    return (sqrt((float)((xd*xd)+(yd*yd))));
  }
  
  public void placeAgent(Agent a, int x, int y) {
    Square[] getRow = column[y-1];
    Square getSquare = getRow[x-1];
    if(getSquare.getAgent() != null)
      throw new Error(" Agent to be placed in occupied Square");
    getSquare.setAgent(a);
    used.add(getSquare);
    getRow[x-1] = getSquare;
    column[y-1] = getRow;
  }
  
  public LinkedList<Square> generateVision(int row, int col, int radius) {
    LinkedList<Square> list = new LinkedList<Square>();
    int x;
    int y;
    Square[] getRow = column[col];
    Square getSquare = getRow[row];
    list.add(getSquare);
    for(int i=1; i<=radius; i++){
      x = i; y = i;
      for(int t=0; t<4; t++){
        if(t % 2 == 0 && y + col >= 0 && y + col < hei){
           getRow = column[col+y];
           getSquare = getRow[row];
           y *= -1;
           if(getSquare.getAgent() == null)
           list.add(getSquare);
        }
        else if(t % 2 != 0 && x + row >= 0 && x + row < wid){
           getRow = column[col];
           getSquare = getRow[row+x];
           x *= -1;
           if(getSquare.getAgent() == null)
           list.add(getSquare);
          }
      }
    }
    return list;
  }
  
  public void update() {
    int YrCount = 0;
    int XrCount = 0;
    LinkedList<Square> alone = new LinkedList<Square>();
    boolean dontdo = false;
    
    while(YrCount < hei){
      while(XrCount < wid){
        
        
        Square[] getRow = column[YrCount];
        Square getSquare = getRow[XrCount];
        GrowbackRule.growBack(getSquare);

        
        
        if(getSquare.getAgent() != null){

          
          for(int s = 0; s < alone.size(); s++){
            if(getSquare == alone.get(s)){
              dontdo = true; break;}
          }
          
          if(dontdo != true){
          LinkedList<Square> getList = generateVision(XrCount, YrCount, getSquare.getAgent().getVision());
          Square newSquare = getSquare.getAgent().getMovementRule().move(getList, this, getSquare);
          getSquare.getAgent().move(getSquare, newSquare);
          if(newSquare.getAgent().isAlive() == false){
            newSquare.setAgent(null);
            
          }
            
          else{
            newSquare.getAgent().step();
            newSquare.getAgent().eat(newSquare);
          }
          
          alone.add(newSquare);
          }
          
        }
        dontdo = false;
        this.used = alone;
        XrCount++;
      }
      YrCount++;
      XrCount = 0;
    }
  }
  
  void display() {    
    int YrCount = 0;
    int XrCount = 0;
    while(YrCount < hei){
      while(XrCount < wid){
        Square[] getRow = column[YrCount];
        Square getSquare = getRow[XrCount];
        getSquare.display(len);
        XrCount++;
      }
      YrCount++;
      XrCount = 0;
    }
    }
    
    
    public void addAgentAtRandom(Agent a){
      int x = (int)random(1, this.wid+1);
      int y = (int)random(1, this.hei+1);
      boolean yes = false;
      for(int i = 0; i < used.size(); i++){
        Square get = used.get(i);
        if((get.getX()/len)+1 == x && (get.getY()/len)+1 == y){
        yes = true; break;}
      }
      if(yes == true)
        addAgentAtRandom(a);
      else
        this.placeAgent(a, x, y);
    }
    
    
    public ArrayList<Agent> getAgents(){
      int YrCount = 0;
      int XrCount = 0;
      ArrayList<Agent> list = new ArrayList<Agent>();
       while(YrCount < hei){
       while(XrCount < wid){
        Square[] getRow = column[YrCount];
        Square getSquare = getRow[XrCount];
        if(getSquare.getAgent() != null){
          list.add(getSquare.getAgent());
        }
        getRow[XrCount] = getSquare;
        column[YrCount] = getRow;
        XrCount++;
      }
      YrCount++;
      XrCount = 0;
    }
      return list;
    }
    
  
}
  
  
  
  
  
  
  
  
  
  