import java.util.Random;


abstract class Sorter{
  
  
  public abstract void sort(ArrayList<Agent> al);
  
  
  public boolean lessThan(Agent a, Agent b){
    return a.getSugarLevel() < b.getSugarLevel();
  }
  
  
}


class BubbleSorter extends Sorter{
  
  public BubbleSorter(){
  }
  
  public void sort(ArrayList<Agent> al){
    boolean fin = false;
    while(fin == false){
      fin = true;
    for(int i = 0; i < al.size()-1; i++){
      Agent a = al.get(i);
      Agent b = al.get(i+1);
      if(lessThan(a, b) == false){
        al.set(i, b); al.set(i+1, a); fin = false;}
    }
  }
  }
  
}




class InsertionSorter extends Sorter{
  
      public InsertionSorter(){
  }
  
  public void sort(ArrayList<Agent> al){
    for(int i = 0; i < al.size(); i++){
      Agent a = al.get(i); int aloc = i;
      for(int j = i-1; j >= 0; j--){
        Agent b = al.get(j);
        if(lessThan(a, b) == true){
          al.remove(aloc); al.add(j, a); aloc = j;}
        else
            break;
      }
    }
  }
  
  
}







class MergeSorter extends Sorter{
    
    public MergeSorter(){
    }
    
    
    public void sort(ArrayList<Agent> al){
        ArrayList<Agent> l1 = new ArrayList<Agent>();
        ArrayList<Agent> l2 = new ArrayList<Agent>();
        int size = al.size();
      
        for(int i = 0; i < size; i++){
          if(i % 2 == 0){
            l1.add(al.get(i));}
          else{
            l2.add(al.get(i));}
        }
        
        if(l1.size() > 1){
            
            sort(l1);
            
        }
        if(l2.size() > 1){
            
            sort(l2);
            
        }
        
        al.clear();
        al.addAll(Merge(l1, l2));
        
    
    }
    
    
    private ArrayList<Agent> Merge(ArrayList<Agent> l1, ArrayList<Agent> l2)
    {
        
        
            
        ArrayList<Agent> l3 = new ArrayList<Agent>();
        while(l1.size() > 0 || l2.size() > 0){
            if(l1.size() == 0){
              l3.add(l2.get(0)); l2.remove(0);}
            else if(l2.size() == 0){
              l3.add(l1.get(0)); l1.remove(0);}
            else{
              if(lessThan(l1.get(0), l2.get(0))){
                l3.add(l1.get(0)); l1.remove(0);}
              else{
                l3.add(l2.get(0)); l2.remove(0);}
            }
            
        }
        
        return l3;
    }
    
    
 
   
   
}





class QuickSorter extends Sorter{
    
    public QuickSorter(){
    }
    
    
    public void sort(ArrayList<Agent> al){
        ArrayList<Agent> l1 = new ArrayList<Agent>();
        ArrayList<Agent> l2 = new ArrayList<Agent>();
        int size = al.size();
        
        if(size != 0){
        Agent pivot = al.get(size-1);
        
       
        
        
        for(int i = 0; i < size; i++){
            if(lessThan(al.get(i), pivot))
                l1.add(0, al.get(i));
             else{
                if(al.get(i) == pivot){
                if(new Random().nextBoolean() == true)
                    l1.add(0, al.get(i));
                else
                    l2.add(0, al.get(i));
                }
                else
                l2.add(0, al.get(i));
                }
                  }
        }
        al.clear();
        
        if(l1.size() > 1)
           sort(l1); 
        if(l2.size() > 1)
          sort(l2);
        
        al.addAll(l1); al.addAll(l2);
    }
        
     }
  