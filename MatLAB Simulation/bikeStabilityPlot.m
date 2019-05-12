function [reg_stable_start, reg_stable_stop, v, ripoles] = bikeStabilityPlot(v_min, v_step, v_max, Bike)

    poles = zeros(4, length(v_min:v_step:v_max));
    zero_line = zeros(4, length(v_min:v_step:v_max));
    
    count = 1;
    is_stable = false;
    
    reg_stable_start = 0.0;
    reg_stable_stop = 0.0;
    
    for v = v_min:v_step:v_max
         
        [~, A] = setBikeStateSpace(Bike, v, false);
        poles(:, count) = real(eigs(A));
        ripoles(:, count) = eigs(A);
        
        if (~is_stable)
           
            is_stable = true;
            
            for i=1:4
                if (poles(i, count) >= 0.0)
                    is_stable = false;
                    break;
                end
            end
            
            if (is_stable)
                reg_stable_start = v;
                reg = true;
            end
            
        elseif (is_stable && reg)
            
            for i=1:4
               if (poles(i, count) >= 0.0)
                   is_stable = false;
                   break;
               end
            end
            
            if (~is_stable)
                reg_stable_stop = v;
            end
            
        end
        
        count = count + 1;
        
    end
    
    v = v_min:v_step:v_max;
    
    plot(v, poles, v, zero_line, '--')
    vline(reg_stable_start)
    vline(reg_stable_stop)
    
    title('Stability vs Forward Speed (Uncontrolled Bicycle)')
    xlabel('Forward Speed (m/s)')
    ylabel('Real Part of Eigenvalue')
    
    M = vertcat(v,poles)';
    csvwrite('StabilityVsForwardSpeed.csv', M);