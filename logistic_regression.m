function theta = logistic_regression( y, X )
%% ============ Part 2: Compute Cost and Gradient ============

[m, n] = size(X);
%X = [ones(m, 1) X];

initial_theta = zeros(n, 1);


%% ============= Part 3: Optimizing using fminunc  =============
options = optimset('GradObj', 'on', 'MaxIter', 400);

[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

end

function [J, grad] = costFunction(theta, X, y)
m = length(y);

J = 0;
grad = zeros(size(theta));


for i = 1:m
    J = J + (-y(i)*log(1/(1+exp(-dot(theta,X(i,:))))) - ...
        (1 - y(i))*log(1 - 1/(1+exp(-dot(theta,X(i,:))))))/m;
end

for j = 1:length(theta)
    for i = 1:m
        grad(j) = grad(j) + (1/(1+exp(-dot(theta,X(i,:)))) - ...
            y(i))*X(i,j)/m;
    end
end

end


function g = sigmoid(z)
   g = 1./(1+exp(-z));
end