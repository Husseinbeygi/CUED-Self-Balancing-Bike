v = 4.0;

Bike = getBikeModel(1);
[Bike, ~, ~, ~, ~, ssBike] = setBikeStateSpace(Bike, v, true);

G = tf(ssBike('Lean Angle', 'Handlebar Torque'));
s = tf('s');

figure
hold on

for Kp = -10:0.1:10
    
    for Kd = -10:0.1:10
   
        K = Kp + Kd * s;
        
        CL = minreal(K * G / (1 + K * G));
       
        step(CL)
        
    end
    
end