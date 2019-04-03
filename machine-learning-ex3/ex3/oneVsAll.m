function [all_theta] = oneVsAll(X, y, num_labels, lambda)
% ONEVSALL trains multiple logistic regression classifiers and returns all
% the classifiers in a matrix all_theta, where the i-th row of all_theta 
% corresponds to the classifier for label i

%   [all_theta] = ONEVSALL(X, y, num_labels, lambda) trains num_labels
%   logistic regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds 
%   to the classifier for label i

% Some useful variables
m = size(X, 1);     % # rows ie: images
n = size(X, 2);     % # cols ie: pixel value
max_iter = 50;

%fprintf('dims y=%d\n', size(y));
%fprintf('num_labels=%d\n', num_labels);
%fprintf('lambda=%.1f\n', lambda);

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1);
%fprintf('all_theta size=%.1f\n',size(all_theta));

% Add ones to the X data matrix
X = [ones(m, 1) X];
%fprintf('dims X=%d\n', size(X));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the following code to train num_labels
%               logistic regression classifiers with regularization
%               parameter lambda. 
%
% Hint: theta(:) will return a column vector.
%
% Hint: You can use y == c to obtain a vector of 1's and 0's that tell you
%       whether the ground truth is true/false for this class.
%
% Note: For this assignment, we recommend using fmincg to optimize the cost
%       function. It is okay to use a for-loop (for c = 1:num_labels) to
%       loop over the different classes.
%
%       fmincg works similarly to fminunc, but is more efficient when we
%       are dealing with large number of parameters.
%
%
%     % Set Initial theta
     initial_theta = zeros(n + 1, 1);
%     
%     % Set options for fminunc
     options = optimset('GradObj', 'on', 'MaxIter', max_iter);
%
% loop through classifiers
for i = 1:num_labels

  % Run fmincg to obtain the optimal theta
  % This function will return theta and the cost 
  %fprintf('optimal fcn sixe =%d\n', size(fmincg (@(t)(lrCostFunction(t, X, (y == i), lambda)), initial_theta, options)))

  all_theta(i,:) = fmincg (@(t)(lrCostFunction(t, X, (y == i), lambda)), initial_theta, options);

end

% =========================================================================

end
