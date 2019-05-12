% Model parameters
k = 0.5;

% Observer model (linearised, including modelling errors)
Aobs = [0, 1; -1 * 0.7, -k * 1.5]; % True linearised model is: A = [0, 1; -1, -k]
Cobs = eye(2);
L    = [3.1221, 0.1192; 0.1192, 2.3503];
m_noise = 1e-3;
m_bias  = 0.0;

Ts = 0.1;
Tmax = 20;
t = 0:Ts:Tmax;
N = length(t);

x1 = zeros(1, N); x2 = zeros(1, N);
x1hat = zeros(1, N); x2hat = zeros(1, N);

% Initial conditions and guesses
x1(1) = 45 * pi / 180; x1hat(1) = 70 * pi / 180;
x2(1) = 0;             x2hat(1) = 0;

for i=2:N
   
    % True system
    x2(i) = x2(i - 1) + Ts * (-sin(x1(i - 1)) - k * x2(i - 1));
    x1(i) = x1(i - 1) + Ts * x2(i);
    
    % Luenberger observer
    xhatprev = [x1hat(i - 1); x2hat(i - 1)];
    measurements = [x1(i) + m_noise * randn() + m_bias; x2(i) + m_noise * randn() + m_bias];
    xdothat = (Aobs - L * Cobs) * xhatprev + L * measurements;
    xhat = xhatprev + xdothat * Ts;
    x1hat(i) = xhat(1); x2hat(i) = xhat(2);
    
    plot(t(1:i), x1(1:i) * 180 / pi, t(1:i), x1hat(1:i) * 180 / pi)
    pause(0.01)
    
end

ylabel('Angle (Deg)')
xlabel('Time (s)')
legend('True', 'Estimate')