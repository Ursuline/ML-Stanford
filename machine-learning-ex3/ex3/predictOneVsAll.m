function p = predictOneVsAll(all_theta, X)
%  PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%  are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

% Here is an outline for forward propagation using the vectorized method. This is an implementation 
% of the formula in Figure 2 on Page 11 of ex3.pdf.

% Add a column of 1's to X (the first column), and it becomes 'a1'.
% Multiply by Theta1 and you have 'z2'.
% Compute the sigmoid() of 'z2', then add a column of 1's, and it becomes 'a2'
% Multiply by Theta2, compute the sigmoid() and it becomes 'a3'.
% Now use the max(a3, [], 2) function to return two vectors - one of the highest value for each row, and one with its index. 
% Ignore the highest values. Keep the vector of the indexes where the highest values were found. These are the predictions.
% Note: When you multiply by the Theta matrices, you'll have to use transposition to get a result that is the correct size.

% Note: The predictions must be returned as a column vector - size (m x 1). 
% If you return a row vector, the script will not compute the accuracy correctly.

% Note: Not getting the correct results? In the hidden layer, be sure you use sigmoid() first, then add the bias unit.

% ------ dimensions of the variables ---------

% a1 is (m x n), where 'n' is the number of features including the bias unit
% Theta1 is (h x n) where 'h' is the number of hidden units
% a2 is (m x (h + 1))
% Theta2 is (c x (h + 1)), where 'c' is the number of labels.
% a3 is (m x c)
% p is a vector of size (m x 1)

m           = size(X, 1);
sz_theta    = size(all_theta);
num_labels  = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);
sz_p = size(p);

% Add ones to the X data matrix
a1 = [ones(m, 1) X];
sz_a1 = size(a1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.

z = a1 * all_theta';
a2 = sigmoid(z);
%a2 = [ones(m, 1) a2];
sz_a2 = size(a2);

[v p] = max(a2,[],2);

% =========================================================================

end
