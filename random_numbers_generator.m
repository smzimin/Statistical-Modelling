n = 10^4;

z0 = rand;
a = 3*rand;
c = 1/pi;
m = 1;

z_n = @(z) mod(a*z + c,m);

x = zeros(1,n);
y = zeros(1,n);

x(1) = z_n(z0);
for i = 1:n-1
    y(i) = z_n(x(i));
    x(i+1) = z_n(y(i));
end
y(n) = z_n(x(n));

% scatter(x,y)
% comet(x,y)