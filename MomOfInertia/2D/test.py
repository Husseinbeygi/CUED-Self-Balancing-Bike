from grid import Grid
from inertiatensor import InertiaTensor
from CenterOfMass import CenterOfMass
from math import pi, sin, cos

def vol(c, l):
	r = c / (2 * pi)
	return (pi * r * r * l)
	
gridStep = 0.01

# Total mass
mt = 7.0;

# Rod angles
a15 = 63 * pi / 180.0
a25 = 63 * pi / 180.0
a4  = 47 * pi / 180.0

# Rod lengths and volumes
l1 = 0.505; v1 = 2 * vol(0.0550, l1)		# There are two of these!!
l2 = 0.500; v2 = vol(0.0925, l2)
l3 = 0.550; v3 = vol(0.1025, l3)
l4 = 0.615; v4 = vol(0.1125, l4)
l5 = 0.460; v5 = 2 * vol(0.0550, l5)		# There are two of these!!

# Rod start and end coordinates
x1a = 0.000; y1a = 0.000; x1b = 0.205; y1b = 0.460;
x2a = 0.205; y2a = 0.460; x2b = 0.459; y2b = 0.03;
x3a = 0.205; y3a = 0.460; x3b = 0.745; y3b = 0.575; # Need to add a small height to avoid 0 gradient
x4a = 0.745; y4a = 0.575; x4b = 0.459; y4b = 0.03;
x5a = 0.000; y5a = 0.000; x5b = 0.459; y5b = 0.03; # Same reason as for y3b

# Total volume
vt = v1 + v2 + v3 + v4 + v5

# Masses
m1 = v1 * (mt / vt)
m2 = v2 * (mt / vt)
m3 = v3 * (mt / vt)
m4 = v4 * (mt / vt)
m5 = v5 * (mt / vt)

# Create 2D grid
g = Grid(0, 1, 0, 1, gridStep)

# Add rods

g.addRod(m1, x1a, y1a, x1b, y1b)
g.addRod(m2, x2a, y2a, x2b, y2b)
g.addRod(m3, x3a, y3a, x3b, y3b)
g.addRod(m4, x4a, y4a, x4b, y4b)
g.addRod(m5, x5a, y5a, x5b, y5b)

g.draw()

I   = InertiaTensor(g)
COM = CenterOfMass(g)

[xcm, ycm] = COM.calculate()

print("Center of Mass (x,y) = " + str(round(xcm,3)) + "," + str(round(ycm,3)))

print("Inertia Tensor @ Origin")
I_Origin = I.calculate()
print(I_Origin)

print("Inertia Tensor @ COM")
I_COM = I.calculate(xcm, ycm)
print(I_COM)

print("Inertia Tensor @ COM (referred from Origin)") #(I = Icm + mr^2)
Ixx = I_Origin[0][0] - mt * ycm * ycm
Iyy = I_Origin[1][1] - mt * xcm * xcm
Izz = Ixx + Iyy
Ixy = I_Origin[2][2] - mt * ycm * xcm
print("Ixx = " + str(Ixx) + " Iyy = " + str(Iyy) + " Ixy = " + str(Ixy))

