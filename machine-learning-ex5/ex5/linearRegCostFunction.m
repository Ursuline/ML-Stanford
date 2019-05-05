function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

m     = length(y); % number of training examples
grad  = zeros(size(theta));

% Debugging variables
sz_X      = size(X);
sz_y      = size(y);
sz_theta  = size(theta);
% ---------------------

term_1  = (X * theta - y);
cost    = 1/(2 * m) * sum(term_1.^2);
reg     = lambda/(2 * m) * (sum(theta .* theta) - theta(1)^2); % do not regularize theta_0
J       = cost + reg;

grad    = 1/m * (X' * term_1) + lambda/m * theta;
grad(1) = grad(1) - lambda/m * theta(1); % do not regularize theta_0

% =========================================================================

grad = grad(:);

end
