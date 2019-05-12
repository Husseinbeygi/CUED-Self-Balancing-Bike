class PointList {
 
  int num;
  ArrayList<Integer> Xindex = new ArrayList<Integer>();
  ArrayList<Integer> Yindex = new ArrayList<Integer>();
  
  PointList() {
    num = 0;
  }
  
  void addIndex(int X, int Y) {
   
    Xindex.add(X);
    Yindex.add(Y);
    num++;
    
  }
  
  int len() {
    return num; 
  }
  
  int getX(int i) {
    return Xindex.get(i); 
  }
  
  int getY(int i) {
    return Yindex.get(i); 
  }
  
}
