function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta

sz_t = size(theta);
sz_X = size(X);
sz_y = size(y);

#Compute intermediate values:
Theta_t_x   = X * theta;
h_theta     = sigmoid(Theta_t_x);
log_h_theta = log(h_theta);

sz_log_h_theta = size(log_h_theta);

J     = 1.0 / m * (-y' * log_h_theta - (1 - y') * log(1 - h_theta));
grad  = 1.0 / m * X' * (h_theta - y);

sz_J = size(J)

% =============================================================

end
