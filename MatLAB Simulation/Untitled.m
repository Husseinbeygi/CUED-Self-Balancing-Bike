dt = 0.01;
t  = 0:dt:100;

N = length(t);

dxdt=zeros(1,N); x=zeros(1,N); u = zeros(1,N);
cl = zeros(1, N);

dxdt(1) = 0.0;
x(1)    = 0.1;
cl(1) = x(1) / (1 + x(1));

f = 1;

u(2) = 1;

for n=2:N
    
    if n>2
        u(n)=0;
    end

    %u = 1; %sin(2 * pi * f * t(n));
    
    dxdt(n) = x(n-1)^(-2)*sin(x(n-1)) + u(n);
    x(n) = x(n-1) + dt * dxdt(n);
    cl(n) = x(n) / (1 + x(n));

    
end

plot(t,x,t,cl)