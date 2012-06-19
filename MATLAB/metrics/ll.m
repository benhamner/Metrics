function score = ll(actual, posterior)
%LL   Computes the log loss
%   score = ll(actual, posterior)
%
%   actual is a binary vector
%   posterior is a vector of posterior probabilities that actual==1
%
%   Author: Ben Hamner (ben@benhamner.com)

losses = actual(:).*log(posterior(:)) + ...
    (1-actual(:)).*log(1-posterior(:));
losses(isnan(losses) & ~isinf(losses)) = 0;
score = -losses;
