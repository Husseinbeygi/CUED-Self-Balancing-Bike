A = [0, 1; (m*g*h)/J, 0]; B = [0; 1];
C = [(m*h*V^2)/(b*J), (V*D)/(J*b)];


Q = eye(2);
R = 1000;

K = lqr(A, B, Q, R)

% Closed-loop system
CLlqr = ss(A - B * K, zeros(2,1), C, 0);