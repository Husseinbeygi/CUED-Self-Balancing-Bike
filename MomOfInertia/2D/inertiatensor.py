from grid import Grid
from math import pow

class InertiaTensor:

	def __init__(self, grid):
		self.grid = grid
		self.I = [0] * 3
		
		for i in range(3):
			self.I[i] = [0] * 3
			
	def reset(self):
		self.I = [0] * 3
		
		for i in range(3):
			self.I[i] = [0] * 3
			
	def calculate(self, xOrigin=0.0, yOrigin=0.0):
		
		x = self.grid.xMin; y = self.grid.yMax
		
		for yi in range(self.grid.gridSizeY):
		
			x = self.grid.xMin
		
			for xi in range(self.grid.gridSizeX):
			
				self.I[0][0] += self.grid.dm[yi][xi] * pow(y - yOrigin, 2.0) # Ixx
				self.I[1][1] += self.grid.dm[yi][xi] * pow(x - xOrigin, 2.0) # Iyy
				
				# Ixz
				#self.I[0][2] += self.grid.dm[yi][xi] * pow((y - yOrigin) - (x - xOrigin), 2.0) / 2.0
				self.I[0][2] += self.grid.dm[yi][xi] * (y - yOrigin) * (x - xOrigin)
			
				x += self.grid.gridStep
				
			y -= self.grid.gridStep
			
		self.I[2][2] = self.I[0][0] + self.I[1][1] # Perpendicular axis theorem -> Izz
		
		self.I[2][0] = self.I[0][2] # Symmetrical
			
		return self.I
