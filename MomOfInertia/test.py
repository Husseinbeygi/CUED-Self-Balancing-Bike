from Grid import Grid
from math import pow

tolerance = 0.001

g = Grid(0.0, 0.25, -0.01, 0.01, -0.13, 0.0, 0.005)

# Rear frame
rf_mass = [0.600]
rf_coords_a = [[0, 0, 0]]
rf_coords_b = [[0.18, 0, -0.125]]

# Front frame
ff_mass = [0.090]
ff_coords_a = [[0.22,0,0]]
ff_coords_b = [[0.18,0,-0.125]]

# Combined
mass = 0.0

for i in range(len(rf_mass)):
	mass += ff_mass[i]
	g.addRod(ff_mass[i], ff_coords_a[i], ff_coords_b[i], tolerance)


# Center of mass
com = [0.0, 0.0, 0.0]

x = g.xMin
for xi in range(g.gridSizeX):

	y = g.yMin

	for yi in range(g.gridSizeY):
	
		z = g.zMin
	
		for zi in range(g.gridSizeZ):
			
			com[0] += x * g.dm[xi][yi][zi]
			com[1] += y * g.dm[xi][yi][zi]
			com[2] += z * g.dm[xi][yi][zi]
			
			z += g.gridStep
			
		y += g.gridStep
		
	x += g.gridStep
	
com = [com[0] / mass, com[1] / mass, com[2] / mass]

print("Center of Mass:")
print(com)

# Inertia tensor
I = [[0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]]
xcm = com[0]; ycm = com[1]; zcm = com[2]

x = g.xMin
for xi in range(g.gridSizeX):

	y = g.yMin

	for yi in range(g.gridSizeY):
	
		z = g.zMin
	
		for zi in range(g.gridSizeZ):
			
			dm = g.dm[xi][yi][zi]
			
			# Ixx, Iyy, Izz
			I[0][0] += (pow(y - ycm, 2.0) + pow(z - zcm, 2.0)) * dm
			I[1][1] += (pow(x - xcm, 2.0) + pow(z - zcm, 2.0)) * dm
			I[2][2] += (pow(x - xcm, 2.0) + pow(y - ycm, 2.0)) * dm
			
			# Ixy, Iyx
			I[0][1] += -(x - xcm) * (y - ycm) * dm
			I[1][0] = I[0][1]
			
			# Iyz, Izy
			I[1][2] += -(y - ycm) * (z - zcm) * dm
			I[2][1] = I[1][2]
			
			# Ixz, Izx
			I[0][2] += -(x - xcm) * (z - zcm) * dm
			I[2][0] = I[0][2]			
			
			z += g.gridStep
			
		y += g.gridStep
		
	x += g.gridStep
	
print("Inertia Tensor:")
print(I)
