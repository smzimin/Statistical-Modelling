clear
close all
n_trials = 10^3;
n = 10^1;

f = @(t) normcdf(t,0,1);

W2 = zeros(1,n_trials);
for k = 1:n_trials
    data = normrnd(0,1,1,n);

    x = sort(data);

    W2(k) = sum((f(x) - (2*(1:n)-1)/2/n).^2) + 1/12/n;
end
W2 = sort(W2);
q = W2(900)
hist(W2,15)