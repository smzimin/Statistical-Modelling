function p = log_regr_predict(theta, X)
p = double(sigmoid(X*theta) >= 0.5);
end

function g = sigmoid(z)
   g  = 1./(1+exp(-z));
end