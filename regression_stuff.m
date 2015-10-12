p = 5;
n = 10^2;
a = 0.1;
n_trials = 10^3;

mu1 = 1;
sigma1 = 20;
mu2 = 7;
sigma2 = 7;
sigma3 = 1;
X = normrnd(mu1,sigma1,n,p);
theta_real = normrnd(mu1,sigma2,p,1);

counter = 0;
for i = 1:n_trials
    % y = X'*theta + e
    eps = normrnd(0,sigma3,n,1);
    y = X*theta_real + eps;

    Bmin1 = (X'*X)^-1;
    theta = Bmin1*X'*y;
    %[theta theta_real]

    rss = sum((y-X*theta).^2);
    S2 = rss / (n-p);
    D = S2*diag(Bmin1);

    conf_int = [theta-tinv(1-a/2,n-p-1)*sqrt(D) ...
        theta+tinv(1-a/2,n-p-1)*sqrt(D)];

    temp = theta_real > conf_int(:,1) & ...
        theta_real < conf_int(:,2);
    
    %[conf_int(:,1) theta_real conf_int(:,2) temp];
    
    counter = counter + sum(temp);
end
[1 - a counter / (n_trials * p)]