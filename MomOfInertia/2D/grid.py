from math import ceil
from PIL import Image

class Grid:

	def __init__(self, xMin, xMax, yMin, yMax, gridStep):
		self.xMin = xMin; self.xMax = xMax; self.yMin = yMin; self.yMax = yMax
		self.gridStep = gridStep
		
		self.gridSizeX = int(ceil((xMax - xMin) / gridStep)) + 1
		self.gridSizeY = int(ceil((yMax - yMin) / gridStep)) + 1
		
		self.dm = [0] * self.gridSizeY
		for i in range(self.gridSizeY):
			self.dm[i] = [0] * self.gridSizeX               

	def addRod(self, mass, x1, y1, x2, y2):
		num_elements = 0
		
		gradient  = (y2 - y1) / (x2 - x1)
		intercept = y1 - gradient * x1
		
		if (x1 < x2):
			smallestX = x1;	biggestX  = x2
		else:
			smallestX = x2;	biggestX  = x1
			
		if (y1 < y2):
			smallestY = y1; biggestY = y2
		else:
			smallestY = y2; biggestY = y1
			
		rodpointsX = []
		rodpointsY = []
				
		x = self.xMin; y = self.yMax
		for yi in range(self.gridSizeY + 1):
			
			x = self.xMin
			
			for xi in range(self.gridSizeX + 1):		
						
				if ( abs(y - (gradient * x + intercept)) <= self.gridStep ):
				
					if (x >= smallestX and x <= biggestX and y >= smallestY and y <= biggestY):
						rodpointsX.append(xi)
						rodpointsY.append(yi)
						num_elements += 1
						
				x += self.gridStep
				
			y -= self.gridStep
			
		rod_dm = mass / float(num_elements)	
		
		for i in range(num_elements):
			self.dm[rodpointsY[i]][rodpointsX[i]] += rod_dm
			
	def draw(self):
		img = Image.new( 'RGB', (self.gridSizeY,self.gridSizeX), "black")
		pixels = img.load()
				
		for y in range(self.gridSizeY):
		
			for x in range(self.gridSizeX):
				
				if (self.dm[y][x] > 0):
					pixels[x,y] = (255, 255, 255)
				else:
					pixels[x,y] = (0, 0, 0)
					
		img.show()				
		
