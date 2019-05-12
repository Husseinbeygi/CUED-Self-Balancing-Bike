class InertiaSolver {
 
  Grid grid; // Grid containing position of "dm"s
  float Ixx, Iyy, Izz;
    
  InertiaSolver(Grid grid) {
    
    this.grid = grid;
    reset();
    
  }  
  
  void reset() { Ixx = Iyy = Izz = 0; }
  
  float[] getInertiaTensor(float xOrigin, float yOrigin) {
  
    reset();

    int countX = 0;
    int countY = 0;
    
    for (float x = grid.xMin; x <= grid.xMax; x += grid.gridStep) {
     
      countY = 0;
      
      for (float y = grid.yMax; y >= grid.yMin; y -= grid.gridStep) {
                
        Ixx += grid.dm[countY][countX] * pow(x, 2.0) + grid.dm[countY][countX] * pow(xOrigin, 2.0);
        Iyy += grid.dm[countY][countX] * pow(y, 2.0) + grid.dm[countY][countX] * pow(yOrigin, 2.0);
        
        countY++;
        
      }
      
      countX++;
      
    }
    
    Izz = Ixx + Iyy;
    
    return new float[] {Ixx, Iyy, Izz};
    
  }
  
  float[] getCenterOfMass() {
    
    float xcm = 0.0;
    float ycm = 0.0;
    
    float mass = 0.0;
    
    int countX = 0;
    int countY = 0;
    
    for (float x = grid.xMin; x <= grid.xMax; x += grid.gridStep) {
     
      countY = 0;
      
      for (float y = grid.yMax; y >= grid.yMin; y -= grid.gridStep) {
        
        xcm += grid.dm[countY][countX] * x;
        ycm += grid.dm[countY][countX] * y;
        
        mass += grid.dm[countY][countX];
        
        countY++;
        
      }
      
      countX++;
      
    }
    
    xcm /= mass;
    ycm /= mass;
    
    return new float[] {xcm, ycm};    
    
  }
   
}
