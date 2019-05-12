class CenterOfMass:

	def __init__(self, grid):
		self.grid = grid
		self.xcm = 0.0
		self.ycm = 0.0
			
	def reset(self):
		self.xcm = 0.0
		self.ycm = 0.0
			
	def calculate(self):
		
		x = self.grid.xMin; y = self.grid.yMax
		mass = 0.0
		
		for yi in range(self.grid.gridSizeY):
		
			x = self.grid.xMin
		
			for xi in range(self.grid.gridSizeX):
			
				mass += self.grid.dm[yi][xi]
			
				self.xcm += self.grid.dm[yi][xi] * x
				self.ycm += self.grid.dm[yi][xi] * y
				
				x += self.grid.gridStep
				
			y -= self.grid.gridStep
			
		self.xcm /= mass
		self.ycm /= mass
				
		return [self.xcm, self.ycm]