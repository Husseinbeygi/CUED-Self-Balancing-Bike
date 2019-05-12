class Grid {
  
  float gridStep; 
  float xMin, xMax;  
  float yMin, yMax;
    
  int gridSizeX, gridSizeY;
    
  float[][] dm; // !!! [Y][X] Y=0 means Ymax, X=0 means Xmin !!!
  
  Grid(float xMin, float xMax, float yMin, float yMax, float gridStep) {
    
    this.xMin = xMin; this.xMax = xMax; this.yMin = yMin; this.yMax = yMax; this.gridStep = gridStep;
    
    gridSizeX = (int) ceil((xMax - xMin) / gridStep) + 1;
    gridSizeY = (int) ceil((yMax - yMin) / gridStep) + 1;
    
    dm = new float[gridSizeY][gridSizeX];
    
  }
  
  void clearGrid() {
   
    for (int i = 0; i < gridSizeX; i++)
      for (int j = 0; j < gridSizeY; j++)
        dm[j][i] = 0;
    
  }
  
  void addRod(float mass, float circumference, float x1, float y1, float x2, float y2) {
   
    int num_elements = 0;
        
    float radius = circumference / (2 * PI);
        
    float gradient  = (y2 - y1) / (x2 - x1);
    float intercept = y1 - gradient * x1; 
    
    int countX = 0;
    int countY = 0;
    
    PointList setpoints = new PointList();
    
    float minX = (x1 <= x2) ? x1 : x2;
    float maxX = (x1 <  x2) ? x2 : x1;
    
    float minY = (y1 <= y2) ? y1 : y2;
    float maxY = (y1 <  y2) ? y2 : y1;
    
    for (float x = xMin; x <= xMax; x += gridStep) {
     
      countY = 0;
      
      for (float y = yMax; y >= yMin; y -= gridStep) {
        
        if ( abs((y - (gradient * x + intercept))) <= gridStep && x >= minX && x <= maxX && y >= minY && y <= maxY) { // Check if current grid element lies on line
          
          setpoints.addIndex(countX, countY);
          num_elements++;
          
        }
        
        countY++;
        
      }
      
      countX++;
      
    }
    
    // Calculate mass element
    float rod_dm = mass / float(num_elements);
    
    // Add all mass elements of rod to existing grid
    for (int i = 0; i < setpoints.len(); i++)
      dm[setpoints.getY(i)][setpoints.getX(i)] += rod_dm;
      
  }
  
  void drawGrid() {
    
    background(200);
    
    translate(width / 2, height / 2);
    
    noFill();
    stroke(0, 0, 255);
    
    int countX = 0;
    int countY = 0;

    
    for (float x = xMin; x <= xMax; x += gridStep) {
     
      countY = 0;
      
      for (float y = yMax; y >= yMin; y -= gridStep) {
        
        if (dm[countY][countX] > 0)
          point(x * 100, -y * 100);
        
        countY++;
        
      }
      
      countX++;
      
    }
    
  }
    
}
