% Constants
b = 0.001;
g = 9.81;
M = 1.0;
m = 0.25;
l = 0.4;

I = m * l^2 / 3;

p = (I*(M+m)+M*m*l^2);

A = [0      1              0           0;
     0 -(I+m*l^2)*b/p  (m^2*g*l^2)/p   0;
     0      0              0           1;
     0 -(m*l*b)/p       m*g*l*(M+m)/p  0];

B = [0; (I+m*l^2)/p; 0; m*l/p];

Cfull = eye(4);
Cimu = [0 0 180/pi 0; 0 0 0 180/pi];
C = [0 0 180/pi 0];

states = {'x' 'x_dot' 'phi' 'phi_dot'};
inputs = {'Force'};
%outputs = {'x'; 'xdot'; 'phi'; 'phidot'};

Gss = ss(A,B,C,0,'statename',states,'inputname',inputs,'outputname',{'phi'});
s=tf('s');