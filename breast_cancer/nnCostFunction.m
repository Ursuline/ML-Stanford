function [J grad] = nnCostFunction(nn_params,                                   input_layer_size,                                   hidden_layer_size,                                   num_labels,                                   X, y, lambda)%NNCOSTFUNCTION Implements the neural network cost function for a two layer%neural network which performs classification%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...%   X, y, lambda) computes the cost and gradient of the neural network. The%   parameters for the neural network are "unrolled" into the vector%   nn_params and need to be converted back into the weight matrices. % %   The returned parameter grad should be a "unrolled" vector of the%   partial derivatives of the neural network.%% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices% for our 2 layer neural networkTheta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)),                 hidden_layer_size, (input_layer_size + 1));Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end),                 num_labels, (hidden_layer_size + 1));sz_theta1 = size(Theta1);sz_theta2 = size(Theta2);sz_X      = size(X);% Setup some useful variablesm     = size(X, 1);%debugging variablesclass_y           = class(y);input_layer_size  = input_layer_size;hidden_layer_size = hidden_layer_size;lambda            = lambda;sz_y              = size(y);num_labels        = num_labels;% Initialize the gradient vectorsTheta1_grad       = zeros(size(Theta1));Theta2_grad       = zeros(size(Theta2));% Part 1: Feedforward the neural network and return the cost in the%         variable J. %% Part 2: Implement the backpropagation algorithm to compute the gradients%         Theta1_grad and Theta2_grad. You should return the partial derivatives of%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and%         Theta2_grad, respectively. After implementing Part 2, you can check%         that your implementation is correct by running checkNNGradients%%         Note: The vector y passed into the function is a vector of labels%               containing values from 1..K. You need to map this vector into a %               binary vector of 1's and 0's to be used with the neural network%               cost function.%%         Hint: We recommend implementing backpropagation using a for-loop%               over the training examples if you are implementing it for the %               first time.%% Part 3: Implement regularization with the cost function and gradients.%%         Hint: You can implement this around the code for%               backpropagation. That is, you can compute the gradients for%               the regularization separately and then add them to Theta1_grad%               and Theta2_grad from Part 2.%% Part 1: Forward propy_matrix    = y;# Add bias to X -> a1a1    = [ones(m, 1) X];sz_a1 = size(a1);# z_(i+1) = a_i*Theta_i(T)# a_i = sigmoid(z_i)z2 = a1*Theta1';a2 = sigmoid(z2);# Add bias  to a2a2    = [ones(m, 1) a2];sz_a2 = size(a2);z3    = a2*Theta2';a3    = sigmoid(z3);sz_a3 = size(a3);% Implement J(θ)= 􏰄􏰄sum_i sum_k [ −y(i)log((hθ(x(i)))k) − (1−y(i))log(1−(hθ(x(i)))k) ]% a3 is the (hθ(x(i)))k in log(hθ(x(i)))klog_a3    = log(a3);sz_log_a3 = size(log_a3);log_1_minus_a3  = log(1 - a3);one_minus_y     = 1 - y_matrix;term_1 = -trace(y_matrix'*log_a3);term_2 = trace(one_minus_y'*log_1_minus_a3);% Cost function term (witout regularization):J = (term_1 - term_2)/m;% Compute the regularization terms 􏰄􏰄% First remove the bias terms (1st column)Theta_mod1 = Theta1(:, 2:end);Theta_mod2 = Theta2(:, 2:end);term_1  = trace(Theta_mod1'*Theta_mod1);term_2  = trace(Theta_mod2'*Theta_mod2);regul   = lambda/(2 * m) * (term_1 + term_2);J = J + regul;% Part 2: Backprop % compute error in output layer:d3 = a3 - y_matrix;%d3_err = sum(d3)# Dimension checks%sz_d3     = size(d3);%sz_z2     = size(z2);%sz_theta2 = size(Theta2);# Remove the bias term in the Theta_2 matrix:Theta_mod2    = Theta2(:, 2:end);sz_theta_mod2 = size(Theta_mod2);d2 = d3 * Theta_mod2 .* sigmoidGradient(z2);sz_d2 = size(d2);sz_a1 = size(a1);# Delta 2 has dims K x LDelta2 = d3' * a2;Delta1 = d2' * a1;Theta1_grad = Delta1 / m;Theta2_grad = Delta2 / m;% Gradient regularization:T1 = Theta1;T1(:, 1) = 0;T2 = Theta2;T2(:, 1) = 0;Theta1_grad = Theta1_grad + lambda/m * T1;Theta2_grad = Theta2_grad + lambda/m * T2;% Unroll gradientsgrad = [Theta1_grad(:) ; Theta2_grad(:)];end