clear

q = 5; 
p = 15; 
n = 1000;
n_trials = 10^4;
alpha = 0.9;

In = 0; 

for m = 1:n_trials 
    X = randn(n,p); 
    theta = [randn(p-q,1); zeros(q,1)]; 

    eps = normrnd(0,1,n,1); 

    y = X*theta + eps; 

    B = X'*X; 
    theta_hat = B^-1*X'*y; 
    RSS = sum((y - X*theta_hat).^2);
    
    X_restr = X(:,1:p-q);
%     B_restr = X_restr'*X_restr; 
%     theta_hat_restr = B_restr^-1*X_restr'*y; 
    theta_hat_restr = theta_hat(1:p-q);
    RSS_H0 = sum((y - X_restr*theta_hat_restr).^2);

    F = (RSS_H0-RSS)*(n-p)/q/RSS; 

     

    Kv = finv(alpha,q,n-p);
    
    In = In + (F<=Kv); 
end

Total = In/n_trials