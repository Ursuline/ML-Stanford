function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%
% return indices in vector y of 1 and 0 values 
% to split X into 2 separate vectors
pos = find(y == 1);
neg = find(y == 0);

sz = 125;
scatter(X(pos, 1), X(pos, 2), sz, '+')
scatter(X(neg, 1), X(neg, 2), 'filled', 'o')








% =========================================================================



hold off;

end
