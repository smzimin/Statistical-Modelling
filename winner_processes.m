close all;
T = 50;
n = 1000;
t = linspace(0,T,n);
dt = T/n;

N = 3;
film = true;
w = zeros(n,N);

for i = 2:n
    w(i,:) = w(i-1,:) + sqrt(dt)*normrnd(0,1,1,N);
end

if film == true
if N == 1
    comet(t,w(:,1))
elseif N == 2
    comet(w(:,1),w(:,2))
elseif N == 3
    comet3(w(:,1),w(:,2),w(:,3))
end
else
    if N == 1
    plot(t,w(:,1))
elseif N == 2
    plot(w(:,1),w(:,2))
elseif N == 3
    plot3(w(:,1),w(:,2),w(:,3))
    end
end