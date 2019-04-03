function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   g = SIGMOID(z) computes the sigmoid of z.
% g(z) = 1 / (1 + e^(-z))


% ====================== YOUR CODE HERE ======================
% Instructions: Compute the sigmoid of each value of z (z can be a matrix,
%               vector or scalar).

g = 1.0 ./ ( 1.0 + exp(-z) );


% =============================================================

end
