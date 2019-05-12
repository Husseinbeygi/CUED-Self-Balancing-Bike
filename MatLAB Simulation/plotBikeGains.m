Bike = getBikeModel(1);

v_min = 0;
v_max = 1;
v_step = 0.01;

N = length(v_min:v_step:v_max);

K = zeros(N, 4);
P = zeros(N, 4);

count = 1;
for v=v_min:v_step:v_max
   
    [Bike, A, B] = setBikeStateSpace(Bike, v, false);
    
    B = B(:,2); % Can only actuate handlebars
    
    poles = zeros(1, 4);
    Aeig  = eig(A);
    
    for i = 1:4
        if (real(Aeig(i)) > 0)
            poles(i) = -Aeig(i);
        else
            poles(i) = Aeig(i);
        end
        
        poles(i) = poles(i) - 2;
        
    end
    
   
    
    K(count, :) = acker(A, B, poles);
    P(count, :) = poles;
    
    count = count + 1;   
    
end

v = v_min:v_step:v_max;
plot(v, K)
figure
plot(v, real(P))