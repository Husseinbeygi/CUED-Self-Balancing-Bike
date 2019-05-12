void setup() { 

  noLoop();
  size(400, 400);

  float gridStep = 0.001;

  float xMin = 0;
  float xMax = 3;

  float yMin = 0;
  float yMax = 3;


  Grid grid = new Grid(xMin, xMax, yMin, yMax, gridStep);

  grid.addRod(0.5227, 0.0, 0, 0, 0.2773, 0.4221);
  grid.addRod(1.3654, 0.0, 0.2773, 0.4221, 0.46, 0.001);
  grid.addRod(1.9596, 0.0, 0.2773, 0.4221, 0.8173, 0.425); // 0.4221
  grid.addRod(2.6667, 0.0, 0.8173, 0.425, 0.46, 0.001);
  grid.addRod(0.4806, 0.0, 0, 0, 0.46, 0.001);

  InertiaSolver IS = new InertiaSolver(grid);

  println(IS.getInertiaTensor(0.532, 0.2761));

  grid.drawGrid();
  
  println(IS.getCenterOfMass());
}
