function score = scoreQuadraticWeightedKappa(X, minRating, maxRating)
%SCOREQUADRATICWEIGHTEDKAPPA    Calculates the quadratic weighted kappa
%   scoreQuadraticWeightedKappa calculates the quadratic weighted kappa
%   value, which is a measure of inter-rater agreement between two raters
%   that provide discrete numeric ratings.  Potential values range from -1  
%   (representing complete disagreement) to 1 (representing complete
%   agreement).  A kappa value of 0 is expected if all agreement is due to
%   chance.
%   
%   scoreQuadraticWeightedKappa(X), where X is nRatings-by-2.  The
%   columns of X represent each of the two raters, and each row represents
%   a sample that each rater scored.
%   
%   The values in X should be integers, and it is assumed that X contains
%   the complete range of possible ratings.  For example, if the rating
%   scale varies from 0-3, then X must contain a 0 and a 3.
%
%   scoreQuadraticWeightedKappa(X, minRating, maxRating), where minRating
%   is the minimum possible rating, and maxRating is the maximum possible
%   rating
%   
%   Author: Ben Hamner (ben@benhamner.com)

if nargin==3
    M = confusionMatrix(X, minRating, maxRating);
else
    M = confusionMatrix(X);
end
[dx,dy] = meshgrid(1:size(M,1),1:size(M,2));
d = (dx-dy).^2 / range(dx(:)).^2;
E = sum(M,2)*sum(M,1);E = E / sum(M(:));
score = 1 -(sum(d(:).*M(:))/sum(M(:))) / (sum(d(:).*E(:))/sum(E(:)));


function M = confusionMatrix(X, minRating, maxRating)
%CONFUSIONMATRIX   Calculates the confusion matrix between two raters

if nargin==3
    u = minRating:maxRating;
else
    u = min(X(:)):max(X(:));
end
nU = length(u);
M = zeros(nU);

for i=1:nU
    for j=1:nU
        M(i,j) = sum( (X(:,1)==u(i)) + (X(:,2)==u(j)) == 2);
    end
end