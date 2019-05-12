Bike.w = 1.0;       % Wheel base
Bike.t = 0.08;       % Trail
Bike.a = 70 * pi / 180.0;    % Head angle
Bike.g = 9.81;       % Gravity

% Rear Wheel
Bike.Rrw = 0.35;      % Radius
Bike.mrw = 1.5;        % Mass
Bike.Axx = 0.07; Bike.Ayy = 0.14; Bike.Azz = 0.07; % Moments of inertia

% Front Wheel
Bike.Rfw = 0.35;     % Radius
Bike.mfw = 1.5;        % Mass
Bike.Dxx = 0.07; Bike.Dyy = 0.14; Bike.Dzz = 0.07; % Moments of inertia 

% Rear Frame
Bike.xrf = 0.439; Bike.yrf = 0; Bike.zrf = -0.579; % Centre of mass
Bike.mrf = 12;      % Mass (incl. rider)
Bike.Bxx = 0.476; Bike.Byy = 1.033; Bike.Bzz = 0.527; Bike.Bxz = 0.274; % Moments of inertia

% Front Frame
Bike.xff = 0.866; Bike.yff = 0; Bike.zff = -0.676; % Centre of mass
Bike.mff = 2;        % Mass
Bike.Cxx = 0.08; Bike.Cyy = 0.07; Bike.Czz = 0.02; Bike.Cxz = -0.02; % Moments of inertia