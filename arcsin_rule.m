close all;
T = 1000;
n = 1000;
t = linspace(0,T,n);
dt = T/n;

num_trials = 10^2;
zero = zeros(num_trials,1);

for k = 1:num_trials
    w = zeros(n,1);
    for i = 2:n
        w(i,:) = w(i-1,:) + sqrt(dt)*normrnd(0,1);
    end
    
    signum = sign(w); 
    signum(w==0) = 1;
    temp = t(diff(signum)~=0);
    if ~isempty(temp) 
        zero(k) = max(temp);
    end
    if mod(k,100) == 0
        k
    end
end

zero = zero(zero~=0);
[f,x] = ecdf(zero);
plot(x, f, 'b','LineWidth',2); hold on;
plot(x, 2*asin(sqrt(x/T))/pi, 'r', 'LineWidth',2);
