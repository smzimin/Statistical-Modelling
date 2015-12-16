rng(123)

k = 10;
n = 10^1;
tr = 7;
Q = rand(k);
S = Q'*Q;

[eig_vects,eig_vals] = eig(S);

temp = zeros(k);
for i = 1:k
    temp = temp + eig_vals(i,i) * eig_vects(:,i)*eig_vects(:,i)';
end

error = max(abs(S - temp));

lambdas_new = zeros(1,k);
lambdas_new(1) = k;

for i = 2:k
    lambdas_new(i) = lambdas_new(i-1)*rand;
end

S_new = zeros(k);
for i = 1:k
    S_new = S_new + lambdas_new(i) * eig_vects(:,i)*eig_vects(:,i)';
end

R = S^0.5;

X = normrnd(0,1,n,k);

X_new = R*X';


S_hat = X_new*X_new' / (n-1);
[eig_vects_hat,eig_vals_hat] = eig(S_hat);

F = eig_vects_hat'*X_new;

err = zeros(1,10);
for tr = 5
    X_super_new = eig_vects_hat(:,tr:end)*F(tr:end,:);
    temp = X_super_new - X_new;
    %err(tr) = abs(mean(temp(:)));
    err(tr) = abs(mean(temp(:)))/ abs(mean(X_new(:)));
end

plot(1:10,err)