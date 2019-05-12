from math import ceil, pow, sqrt
#from PIL import Image

class Grid:

	def __init__(self, xMin, xMax, yMin, yMax, zMin, zMax, gridStep):
		self.gridStep = gridStep
	
		self.xMin = xMin; self.xMax = xMax
		self.yMin = yMin; self.yMax = yMax
		self.zMin = zMin; self.zMax = zMax
		
		self.gridSizeX = int(ceil((xMax - xMin) / gridStep)) + 1
		self.gridSizeY = int(ceil((yMax - yMin) / gridStep)) + 1
		self.gridSizeZ = int(ceil((zMax - zMin) / gridStep)) + 1
		
		self.dm = [0] * self.gridSizeX
		for i in range(self.gridSizeX):
			self.dm[i] = [0] * self.gridSizeY
			for j in range(self.gridSizeY):
				self.dm[i][j] = [0] * self.gridSizeZ
		
	def _dist(self, p1, p2):
		sum = pow(p2[0] - p1[0], 2.0) + pow(p2[1] - p1[1], 2.0) + pow(p2[2] - p1[2], 2.0)
		sum = sqrt(sum)
		
		return sum
		
	def _dist2segment(self, v, a, b):

		ab = [b[0] - a[0], b[1] - a[1], b[2] - a[2]]
		av = [v[0] - a[0], v[1] - a[1], v[2] - a[2]]
		
		c1 = ab[0] * av[0] + ab[1] * av[1] + ab[2] * av[2]
		
		if (c1 <= 0.0):
			return self._dist(a, v)
			
		bv = [v[0] - b[0], v[1] - b[1], v[2] - b[2]]
		
		c2 = bv[0] * ab[0] + bv[1] * ab[1] + bv[2] * ab[2]
		
		if (c2 >= 0.0):
			return self._dist(b, v)
			
		cross = [ab[1] * av[2] - av[1] * ab[2], -(ab[0] * av[2] - av[0] * ab[2]), ab[0] * av[1] - av[0] * ab[1]]
		mod_cross = self._dist(cross, [0, 0, 0])
		mod_ab = self._dist(ab, [0, 0, 0])
		
		return (mod_cross / mod_ab)
		
	def addRod(self, mass, p1, p2, tolerance=0.01):
		num_elements = 0
		
		rod_pointsX = []
		rod_pointsY = []
		rod_pointsZ = []
		
		x = self.xMin
		
		for i in range(self.gridSizeX):
			
			y = self.yMin
		
			for j in range(self.gridSizeY):
			
				z = self.zMin
			
				for k in range(self.gridSizeZ):
				
					if (abs(self._dist2segment([x, y, z], p1, p2)) < tolerance):
						rod_pointsX.append(i)
						rod_pointsY.append(j)
						rod_pointsZ.append(k)
						num_elements += 1
				
					z += self.gridStep
					
				y += self.gridStep
				
			x += self.gridStep
					
					
		for i in range(num_elements):
			self.dm[rod_pointsX[i]][rod_pointsY[i]][rod_pointsZ[i]] += mass / float(num_elements)
		
	def draw(self, plane=1):
			
		return
			
		if (plane == 1):
		
			img = Image.new("RGB", (self.gridSizeX, self.gridSizeZ), "black")
			pixels = img.load()
			
			count = 0
			
			for z in range(self.gridSizeZ):
			
				for x in range(self.gridSizeX):
				
					if (self.dm[x][0][z] > 0):
						pixels[x,z] = (255, 255, 255)
					else:
						pixels[x,z] = (0, 0, 0)
						
			img.show()
		