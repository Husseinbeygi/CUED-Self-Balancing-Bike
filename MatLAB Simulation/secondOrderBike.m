bikeID = 1;

if (bikeID == 1) % Lego

    % Forward velocity
    V = 0.44;

    % Bike parameters
    a = 0.10;
    b = 0.225;
    c = 0.025;
    g = 9.81;
    h = 0.11;
    m = 0.76;
    lambda = 55 * pi / 180;
    
    % 2nd order servo model (via system identification toolbox)
    T1 = 0.056; Tw = 0.030; zeta = 0.37; K = 1;
    
    % Model identification
    % 2nd order
    Gsim2 = tf([1.176, 76.9], [1, 58.86, -700.4]);
    % Notice RHP pole near match
    

else % Full-scale
    
    V = 3.0;

    a = 0.26;
    b = 1.08;
    g = 9.81;
    h = 0.55;
    m = 27.5;
    c = 0.085;
    lambda = 70 * pi / 180.0;
    
    T1 = 0.07; Tw = 0.073; zeta = 0.48; K = 1;
    
end

D = m * a * h;
J = m * h * h;

s=tf('s');

% 2nd order bike model (steer angle (degrees) to lean angle (degrees))
G = (V*D / (J*b)) * (s + m*h*V/D) / (s^2 - m*g*h/J);

G2 = a * V * sin(lambda) / (b * h) * (s + (V^2*h-a*c*g)/(V*a*h)) / (s^2-g/h);

% Servo model
Ga = K/((T1*s+1)*(Tw^2*s^2+2*zeta*Tw*s+1));

% Combined system
H = G * Ga;

% State-space representation
% https://lpsa.swarthmore.edu/Representations/SysRepTransformations/TF2SS.html#Example:_Differential_Equation_to_State_Space_(harder)_

A = [0, 1; (m*g*h)/J, 0]; B = [0; 1];
C = [(m*h*V^2)/(b*J), (V*D)/(J*b)];

Gss = ss(A,B,C,0);
