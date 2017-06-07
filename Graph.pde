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
      yloc = (howTall - nextPoint(g) + y);
      if(yloc < y+2)
        yloc = y+2;
      if(yloc > y+howTall-5)
        yloc = y + howTall - 5;
       stroke(0); rect(x+update+15, yloc, 1, 1);}
    
    
    if(update == howWide-5)
      update = 0;
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
  
  int callsPerValue;
  int howWide;
  int numUpdates;
  
  
 public CDFGraph(int x, int y, int howWide, int howTall, 
                String xlab, String ylab, int callsPerValue){
                  
         super(x, y, howWide, howTall, xlab, ylab);         
             this.callsPerValue = callsPerValue;
             this.howWide = howWide;
             this.numUpdates = 0;
                }
                
                
     public abstract void reset(SugarGrid g);  
     
     public abstract int nextPoint(SugarGrid g); 
     
     public abstract float getTotalCalls(SugarGrid g); 
     
     public void update(SugarGrid g){
       this.numUpdates = 0;
       super.update(g);
       reset(g);
       float numPerCell = howWide/getTotalCalls(g);
       println(numUpdates+" "+ nextPoint(g)+" "+ numPerCell+" "+ 1);
       while(numUpdates < getTotalCalls(g)){
         
         rect(numUpdates, nextPoint(g), numPerCell, 1);
         this.numUpdates++;
       }
       
       
     }
                
  
  
}






class WealthCDFGraph extends CDFGraph{
  
  ArrayList<Agent> list = new ArrayList<Agent>();
  int totalSugar;
  int sugarSoFar;
  
  public WealthCDFGraph(int x, int y, int howWide, int howTall, 
                         String xlab, String ylab, int callsPerValue){
              super(x, y, howWide, howTall, xlab, ylab, callsPerValue); 
                         }
                         
              public void reset(SugarGrid g){
                this.sugarSoFar = 0;
                this.totalSugar = 0;
                ArrayList<Agent> rlist = g.getAgents();
                new MergeSorter().sort(rlist);
                this.list.clear(); this.list.addAll(rlist);
                for(Agent agent: rlist){
                  this.totalSugar += agent.getSugarLevel();
                }
              }
  
  
  
                  public int nextPoint(SugarGrid g){
                    int totalNextSugar = 0;
                    int numNextAgent = 0;
                    for(int i = 0; i < callsPerValue; i++){
                      if(i < list.size()){
                      totalNextSugar += list.get(i).getSugarLevel(); numNextAgent++;}
                    }
                    this.sugarSoFar += totalNextSugar/numNextAgent;
                    return (sugarSoFar/totalSugar)/100;
                  }
                  
                  
                  
  
             public float getTotalCalls(SugarGrid g){
               return g.getAgents().size()/callsPerValue;
             }
             
  
  
}