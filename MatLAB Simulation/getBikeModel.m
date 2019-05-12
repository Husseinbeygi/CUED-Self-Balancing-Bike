function Bike = getBikeModel(number)
    
    if (number == 1) % Lego bike
        
        Bike.w = 0.22;
        Bike.t = 0.025;
        Bike.a = 60 * pi / 180.0;
        Bike.g = 9.81;
        
        % Rear Wheel
        Bike.Rrw = 0.04;
        Bike.mrw = 0.030;
        Bike.Axx = 0.5 * Bike.mrw * (Bike.Rrw ^ 2.0); 
        Bike.Ayy = 0.25 * Bike.mrw * (Bike.Rrw ^ 2.0) + ...
                   (Bike.mrw * 0.028 ^ 2.0) / 12.0;
        Bike.Azz = Bike.Axx;        
        
        % Rear Frame
        Bike.xrf = 0.10; Bike.yrf = 0; Bike.zrf = -0.06;
        Bike.mrf =  0.600;  
        Bike.Bxx = 0.000884; Bike.Byy = 0.0; Bike.Bzz = 0.00184; Bike.Bxz = -0.0625;
        
        % Front Frame 
        Bike.xff = 0.229; Bike.yff = 0; Bike.zff = -0.0356;
        Bike.mff = 0.090; 
        Bike.Cxx = 0.000115; Bike.Cyy = 0.0; Bike.Czz = 1.16*1e-5; Bike.Cxz = -0.0625;
        
        % Front Wheel
        Bike.Rfw = 0.04;
        Bike.mfw = 0.03;
        Bike.Dxx = 0.5 * Bike.mfw * (Bike.Rfw ^ 2.0); 
        Bike.Dyy = 0.25 * Bike.mfw * (Bike.Rfw ^ 2.0) + ...
                   (Bike.mfw * 0.028 ^ 2.0) / 12.0;
        Bike.Dzz = Bike.Dxx;

    elseif (number == 2) % Full-scale bike
        
        %%%%%%%%%%%%%%%%%%%%%%
        % Bicycle Parameters %
        %%%%%%%%%%%%%%%%%%%%%%

        Bike.w = 1.08;       % Wheel base
        Bike.t = 0.085;       % Trail
        Bike.a = 70 * pi / 180.0;    % Head angle
        Bike.g = 9.81;       % Gravity

        % Rear Wheel
        Bike.Rrw = 0.32;      % Radius
        Bike.mrw = 10.5;        % Mass
        Bike.Axx = 0.159; Bike.Ayy = 0.317; Bike.Azz = 0.159; % Moments of inertia

        % Rear Frame
        Bike.xrf = 0.507; Bike.yrf = 0; Bike.zrf = -0.534; % Centre of mass
        Bike.mrf = 7.8;       % Mass
        Bike.Bxx = 0.206; Bike.Byy = 0.643; Bike.Bzz = 0.444; Bike.Bxz = 0.164; % Moments of inertia

        % Front Frame
        Bike.xff = 0.96; Bike.yff = 0; Bike.zff = -0.597; % Centre of mass
        Bike.mff = 2.1;        % Mass
        Bike.Cxx = 0.061; Bike.Cyy = 0.059; Bike.Czz = 0.013; Bike.Cxz = -0.017; % Moments of inertia

        % Front Wheel
        Bike.Rfw = 0.32;     % Radius
        Bike.mfw = 2.5;        % Mass
        Bike.Dxx = 0.128; Bike.Dyy = 0.256; Bike.Dzz = 0.128; % Moments of inertia
        
    
    elseif (number == 3) % Schwab

        %%%%%%%%%%%%%%%%%%%%%%
        % Bicycle Parameters %
        %%%%%%%%%%%%%%%%%%%%%%

        Bike.w = 1.02;       % Wheel base
        Bike.t = 0.08;       % Trail
        Bike.a = atan(3);    % Head angle
        Bike.g = 9.81;       % Gravity

        % Rear Wheel
        Bike.Rrw = 0.3;      % Radius
        Bike.mrw = 2;        % Mass
        Bike.Axx = 0.06; Bike.Ayy = 0.12; Bike.Azz = 0.06; % Moments of inertia

        % Rear Frame
        Bike.xrf = 0.3; Bike.yrf = 0; Bike.zrf = -0.9; % Centre of mass
        Bike.mrf = 7; %85;      % Mass (incl. rider)
        Bike.Bxx = 9.2; Bike.Byy = 11; Bike.Bzz = 2.8; Bike.Bxz = 2.4; % Moments of inertia

        % Front Frame
        Bike.xff = 0.9; Bike.yff = 0; Bike.zff = -0.7; % Centre of mass
        Bike.mff = 4;        % Mass
        Bike.Cxx = 0.0546; Bike.Cyy = 0.06; Bike.Czz = 0.0114; Bike.Cxz = -0.0162; % Moments of inertia

        % Front Wheel
        Bike.Rfw = 0.35;     % Radius
        Bike.mfw = 3;        % Mass
        Bike.Dxx = 0.14; Bike.Dyy = 0.28; Bike.Dzz = 0.14; % Moments of inertia
    
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculate terms for equations of motion %
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    Bike.mt =  Bike.mrw + Bike.mrf + Bike.mff + Bike.mfw;
    Bike.xt = (Bike.xrf * Bike.mrf + Bike.xff * Bike.mff + Bike.w * Bike.mfw) / Bike.mt;
    Bike.zt = (-Bike.Rrw * Bike.mrw + Bike.zrf * Bike.mrf + Bike.zff * Bike.mff - Bike.Rfw * Bike.mfw) / Bike.mt;

    Bike.Txx = Bike.Axx + Bike.Bxx + Bike.Cxx + Bike.Dxx + Bike.mrw * Bike.Rrw ^ 2 + Bike.mrf * Bike.zrf ^ 2 + Bike.mff * Bike.zff ^ 2 + Bike.mfw * Bike.Rfw ^ 2;
    Bike.Txz = Bike.Bxz + Bike.Cxz - Bike.mrf * Bike.xrf * Bike.zrf - Bike.mff * Bike.xff * Bike.zff + Bike.mfw * Bike.w * Bike.Rfw;
    Bike.Tzz = Bike.Azz + Bike.Bzz + Bike.Czz + Bike.Dzz + Bike.mrf * Bike.xrf ^ 2 + Bike.mff * Bike.xff ^ 2 + Bike.mfw * Bike.w ^ 2;

    Bike.mf =  Bike.mff + Bike.mfw;
    Bike.xf = (Bike.xff * Bike.mff + Bike.w * Bike.mfw) / Bike.mf;
    Bike.zf = (Bike.zff * Bike.mff - Bike.Rfw * Bike.mfw) / Bike.mf;

    Bike.Fxx = Bike.Cxx + Bike.Dxx + Bike.mff * (Bike.zff - Bike.zf) ^ 2 + Bike.mfw * (Bike.Rfw + Bike.zf) ^ 2;
    Bike.Fxz = Bike.Cxz - Bike.mff * (Bike.xff - Bike.xf) * (Bike.zff - Bike.zf) + Bike.mfw * (Bike.w - Bike.xf) * (Bike.Rfw + Bike.zf);
    Bike.Fzz = Bike.Czz + Bike.Dzz + Bike.mff * (Bike.xff - Bike.xf) ^ 2 + Bike.mfw * (Bike.w - Bike.xf) ^ 2;

    Bike.l = pi / 2 - Bike.a;

    Bike.u = (Bike.xf - Bike.w - Bike.t) * cos(Bike.l) - Bike.zf * sin(Bike.l);

    Bike.Fll = Bike.mf * Bike.u ^ 2 + Bike.Fxx * sin(Bike.l) ^ 2 + 2 * Bike.Fxz * sin(Bike.l) * cos(Bike.l) + Bike.Fzz * cos(Bike.l) ^ 2;
    Bike.Flx = -Bike.mf * Bike.u * Bike.zf + Bike.Fxx * sin(Bike.l) + Bike.Fxz * cos(Bike.l);
    Bike.Flz = Bike.mf * Bike.u * Bike.xf + Bike.Fxz * sin(Bike.l) + Bike.Fzz * cos(Bike.l);

    Bike.f = Bike.t * cos(Bike.l) / Bike.w;

    Bike.Sr = Bike.Ayy / Bike.Rrw;
    Bike.Sf = Bike.Dyy / Bike.Rfw;
    Bike.St = Bike.Sr + Bike.Sf;
    Bike.Su = Bike.mf * Bike.u + Bike.f * Bike.mt * Bike.xt;

    %%%%%%%%%%%%%%%%%%%
    % System Matrices %
    %%%%%%%%%%%%%%%%%%%

    Bike.M   = zeros(2);
    Bike.C_1 = zeros(2);
    Bike.K_0 = zeros(2);
    Bike.K_2 = zeros(2);

    Bike.M(1,1) = Bike.Txx;    Bike.M(1,2) = Bike.Flx + Bike.f * Bike.Txz;
    Bike.M(2,1) = Bike.M(1,2); Bike.M(2,2) = Bike.Fll + 2 * Bike.f * Bike.Flz + Bike.f ^ 2 * Bike.Tzz;

    Bike.C_1(1,1) = 0;                                           Bike.C_1(1,2) = Bike.f * Bike.St + Bike.Sf * cos(Bike.l) + Bike.Txz * cos(Bike.l) / Bike.w - Bike.f * Bike.mt * Bike.zt;
    Bike.C_1(2,1) = -(Bike.f * Bike.St + Bike.Sf * cos(Bike.l)); Bike.C_1(2,2) = Bike.Flz * cos(Bike.l) / Bike.w + Bike.f * (Bike.Su + Bike.Tzz * cos(Bike.l) / Bike.w);

    Bike.K_0(1,1) = Bike.g * Bike.mt * Bike.zt; Bike.K_0(1,2) = -Bike.g * Bike.Su;
    Bike.K_0(2,1) = Bike.K_0(1,2);              Bike.K_0(2,2) = -Bike.g * Bike.Su * sin(Bike.l);

    Bike.K_2(1,1) = 0; Bike.K_2(1,2) = (Bike.St - Bike.mt * Bike.zt) * cos(Bike.l) / Bike.w;
    Bike.K_2(2,1) = 0; Bike.K_2(2,2) = (Bike.Su + Bike.Sf * sin(Bike.l)) * cos(Bike.l) / Bike.w;

    % Common coefficients
    Bike.k0 = Bike.M(1,1) * Bike.M(2,2) - Bike.M(1,2) * Bike.M(2,1);
    Bike.k1 = Bike.M(1,2) / Bike.k0;
    Bike.k2 = Bike.M(2,2) / Bike.k0;
    Bike.k3 = Bike.M(2,1) / Bike.k0;
    Bike.k4 = Bike.M(1,1) / Bike.k0;
    
end