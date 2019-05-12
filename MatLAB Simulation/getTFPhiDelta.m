function G = getTFPhiDelta(Bike, v)
    
    % Transfer function, steering angle to lean angle
    num = [Bike.M(1,2), v * Bike.C_1(1,2), (Bike.K_0(1,2) + v^2 * Bike.K_2(1,2))];
    den = [Bike.M(1,1), v * Bike.C_1(1,1), (Bike.K_0(1,1) + v^2 * Bike.K_2(1,1))];
        
    G = -tf(num, den);
    
end

