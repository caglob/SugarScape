class Graph{
  
int x;
int y;
int howWide;
int howTall;
String xlab;
String ylab;
  
  
    public Graph(int x, int y, int howWide, int howTall, String xlab, String ylab){
           this.x = x;
           this.y = y;
           this.howWide = howWide;
           this.howTall = howTall;
           this.xlab = xlab;
           this.ylab = ylab;  
        }
    
    
    
    public void update(SugarGrid g){
      
      //noStroke();
      noStroke();
      fill(250);
      rect(x, y, howWide+15, howTall+15);
      //rect(x, y, howWide, howTall);
      
      //line(x, y, x, y+howTall);
      //line(x, y+howTall, x+howWide, y+howTall);
      fill(50);
      textSize(15);
      text(xlab, x+15, y+howTall+15);
      pushMatrix();
      translate(x-5, y+(howTall));
      rotate(-PI/2.0);
      text(ylab, 0, 15 );
      popMatrix();
      
    }
    
   
    
    
}



abstract class LineGraph extends Graph{
  
  
  int x;
  int y;
  int howWide;
  int howTall;
  String xlab;
  String ylab;
  int update;
  float yloc;
  int t = 1;
  int mag = 1;
 
  
  
  public LineGraph(int x, int y, int howWide, int howTall, String xlab, String ylab){
    super(x, y, howWide, howTall, xlab, ylab);
    this.x = x;
    this.y = y;
    this. howWide = howWide;
    this.howTall = howTall;
    this.xlab = xlab;
    this.ylab = ylab;
    this.update = 0;
    
  }
  
  
  public abstract int nextPoint(SugarGrid g);
  
  
  public void update(SugarGrid g){
    
    
    
    if(update == 0)
      super.update(g);
    else{
      if(nextPoint(g) > howTall*mag)
      {
      mag ++ ;
      } 
      //println(yloc);
      yloc = (howTall - nextPoint(g)/t + y);
      if(yloc < y+2)
        yloc = y+2;
      if(yloc > y+howTall-5)
        yloc = y + howTall - 5;
       stroke(0); rect(x+update+15, yloc, 1, 1);}
       
    
    
    if(update == howWide-5){
      update = 0;
      t = mag;  
      }
    else
      update++;
    
  }
   
}



class AverageSugarLineGraph extends LineGraph{
  
  
  
  public AverageSugarLineGraph(int x, int y, int howWide, int howTall, String xlab, String ylab) {
    super(x, y, howWide, howTall, xlab, ylab);
  
  }
  
  public int nextPoint(SugarGrid g){
    int y = 0;
    ArrayList<Agent> list = g.getAgents();
    int numAgents = list.size();
    int sum = 0;
    
    for(int i = 0; i < numAgents; i++){
      Agent a = list.get(i);
      sum += a.getSugarLevel();
    }
    
    if(numAgents != 0)
       y = sum/numAgents;
    
    
   
    
    
    return y;
  }
  
  
  
  
  

  
}









class AgentPopulationLineGraph extends LineGraph{
  
  public AgentPopulationLineGraph(int x, int y, int howWide, int howTall, String xlab, String ylab) {
    super(x, y, howWide, howTall, xlab, ylab);
  
  }
  
  public int nextPoint(SugarGrid g){
    noStroke();
    fill(255);
    rect(x, y, 15, 15);
    fill(0);
    text(g.getAgents().size(), x, y+15);
    return g.getAgents().size();
  }
  
  
  
  
}







abstract class CDFGraph extends Graph{
  
  int numPerCell;
  int callsPerValue;
  int howWide;
  int howTall;
  int numUpdates;
  int x;
  int y;
  
  
 public CDFGraph(int x, int y, int howWide, int howTall, 
                String xlab, String ylab, int callsPerValue){
                          
         super(x, y, howWide, howTall, xlab, ylab);  
         this.howWide = howWide; 
         this.howTall = howTall;
         this.callsPerValue = callsPerValue;
         this.x = x;
         this.y = y;
         //print(howWide);
             
                }
                
                
     public abstract void reset(SugarGrid g);  
     
     public abstract int nextPoint(SugarGrid g); 
     
     public abstract int getTotalCalls(SugarGrid g); 
     
     public void update(SugarGrid g){
       numUpdates = 0;
       super.update(g);
       reset(g);
       this.numPerCell = howWide/getTotalCalls(g);
       while(numUpdates < getTotalCalls(g)){
         rect(x + numUpdates, y + nextPoint(g), 
              numPerCell, 1);      //numUpdates, nextPoint(g));
         numUpdates ++;
       }
       
     }
                
  
  
}






class WealthCDFGraph extends CDFGraph{
  
  ArrayList<Agent> list;
  int totalSugar;
  int sugarSoFar;
  
  public WealthCDFGraph(int x, int y, int howWide, int howTall, 
                         String xlab, String ylab, int callsPerValue){
              super(x, y, howWide, howTall, xlab, ylab, callsPerValue); 
                         }
                         
              public void reset(SugarGrid g){
               
               
                
              }
  
  
  
                  public int nextPoint(SugarGrid g){
                    return 1;
                  }
                  
                  
                  
  
             public int getTotalCalls(SugarGrid g){
               return 1;
             }
             
  
  
}