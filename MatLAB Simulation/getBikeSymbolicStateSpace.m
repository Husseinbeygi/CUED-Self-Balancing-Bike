function [A, B, C] = getBikeSymbolicStateSpace(Bike)
   
    A(1,3) = "1"; A(2,4) = "1";
    
    A(1,:) = ["0", "0", "1", "0"];
    A(2,:) = ["0", "0", "0", "1"];
    
    a31_1 = (Bike.k1 * Bike.K_0(2,1) - Bike.k2 * Bike.K_0(1,1));
    a31_2 = (Bike.k1 * Bike.K_2(2,1) - Bike.k2 * Bike.K_2(1,1));
    A(3,1) = string(a31_1) + " + " + string(a31_2) + "*V^2";
    
    a32_1 = (Bike.k1 * Bike.K_0(2,2) - Bike.k2 * Bike.K_0(1,2));
    a32_2 = (Bike.k1 * Bike.K_2(2,2) - Bike.k2 * Bike.K_2(1,2));
    A(3,2) = string(a32_1) + " + " + string(a32_2) + "*V^2";

    a33 = (Bike.k1 * Bike.C_1(2,1) - Bike.k2 * Bike.C_1(1,1));
    A(3,3) = string(a33) + "*V";
    
    a34 = (Bike.k1 * Bike.C_1(2,2) - Bike.k2 * Bike.C_1(1,2));
    A(3,4) = string(a34) + "*V";
    
    a41_1 = (Bike.k3 * Bike.K_0(1,1) - Bike.k4 * Bike.K_0(2,1));
    a41_2 = (Bike.k3 * Bike.K_2(1,1) - Bike.k4 * Bike.K_2(2,1));
    A(4,1) = string(a41_1) + " + " + string(a41_2) + "*V^2";
    
    a42_1 = (Bike.k3 * Bike.K_0(1,2) - Bike.k4 * Bike.K_0(2,2));
    a42_2 = (Bike.k3 * Bike.K_2(1,2) - Bike.k4 * Bike.K_2(2,2));
    A(4,2) = string(a42_1) + " + " + string(a42_2) + "*V^2";
    
    a43 = (Bike.k3 * Bike.C_1(1,1) - Bike.k4 * Bike.C_1(2,1));
    A(4,3) = string(a43) + "*V";
    
    a44 = (Bike.k3 * Bike.C_1(1,2) - Bike.k4 * Bike.C_1(2,2));
    A(4,4) = string(a44) + "*V";

    % Inputs
    B(3,1) =  Bike.k2; B(3,2) = -Bike.k1;
    B(4,1) = -Bike.k3; B(4,2) =  Bike.k4;
    
    % Outputs
    C = eye(4);

end