A = [0 0 1 0; ...
    0 0 0 1; ...
    194 -1.47 0 0; ...
    15.1 229 0 0];

Av = [0 0 0 0; ...
      0 0 0 0; ...
      0 0 -1 -11.9; ...
      0 0 20.9 -8.24];
  
Av2 = [0 0 0 0; ...
       0 0 0 0; ...
       0 -80.5 0 0; ...
       0 -20.0 0 0];
   
B = [0; 0; -4674; 97659];
   
L = [30 0.912 2.34 -0.141; ...
     0.912 30.1 0.398 2.03; ...
     2.34 0.398 0.220 0.0116; ...
     -0.141 2.03 0.0116 0.166];
 
handlebarInput = 0.0;
v = 0.0; 

xhat = [2*pi/180; 0; 0; 0];
xhatprev = [0; 0; 0; 0];

measurement = [5*pi/180; 0; 0; 0];
dt = 0.01;

for i = 1:4
   
    xhatdot = B(i) * handlebarInput;
    xhatprev(i) = xhat(i);
    
    for j = 1:4
        xhatdot = xhatdot + (A(i,j) + Av(i,j) * v + Av2(i,j) * v * v) * xhatprev(j) + L(i, j) * (measurement(j) - xhatprev(j));
    end
    
    xhat(i) = xhatprev(i) + dt * xhatdot;
        
end