%% Initialization
clear ; close all; clc

sigmoid = @(z) 1./(1+exp(-z));

p = 5;
n = 10^2;
a = 0.1;
n_trials = 10^3;

mu1 = 0;
sigma1 = 7;
mu2 = 0;
sigma2 = 1;
sigma3 = 1;


% X = normrnd(mu1,sigma1,n,p);
beta_real = normrnd(mu1,sigma2,p,1);
%beta_real = ones(p,1);

X = [ones(n,1) normrnd(mu1,sigma1,n,p-1)];
eps = 0.01*normrnd(0,1,n,1);

probs = sigmoid(X*beta_real + eps);

r = rand(n,1);
y = double(probs < r);

%y = double(sigmoid(X*beta_real + eps) >= 0.5);
%plotData(X, y);

beta_hat = logistic_regression( y, X ) ;
beta_hat = beta_hat*(beta_real(2)/beta_hat(2));

[beta_real beta_hat]


pred = double(sigmoid(X*beta_hat) < r);

fprintf('Train Accuracy: %f\n', mean(double(pred == y)) * 100);


