close all;
n = 10^4;
h = n^-0.1;
%x = exprnd(7,n,1);
x = normrnd(1,5,n,1);


t = min(x):0.1:max(x);
%y = exppdf(t,7);
y = normpdf(t,1,5);

pn = zeros(size(t));


for i = 1:length(t)
    pn(i) = sum(K((t(i)-x)/h)) / (n*h);
end


plot(t,pn,'LineWidth',2); hold on;
plot(t,y,'r','LineWidth',2);