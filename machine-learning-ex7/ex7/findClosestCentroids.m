function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K    = size(centroids, 1);
nX   = size(X, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
%

for i = 1:nX  % loop over examples
xi = X(i, :);
% Set dummy variables
  dist_temp = 1e9;
  index     = 0;
  for j = 1:K             % loop over centroids
    mu  = centroids(j, :);
    dist = norm(xi - mu); % euclidian distance bw the 2 vectors
    if dist < dist_temp   % update index & distance if this centroid is closer
      dist_temp = dist;
      index = j;
    endif
  endfor
  idx(i, 1) = index;
endfor

% =============================================================

end

