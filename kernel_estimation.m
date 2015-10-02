close all;
n = 10^4;
h = n^-0.1;
x = exprnd(2,n,1);

t = 0:0.1:max(x);
y = exppdf(t,2);

pn = zeros(size(t));


for i = 1:length(t)
    pn(i) = sum(K((t(i)-x)/h)) / (n*h);
end


plot(t,pn,'LineWidth',2); hold on;
plot(t,y,'r','LineWidth',2);