function score = logLoss(actual, posterior)
%LOGLOSS   Computes the log loss
%   score = logLoss(actual, posterior)
%
%   actual is a binary vector
%   posterior is a vector of posterior probabilities that actual==1
%
%   Author: Ben Hamner (ben@benhamner.com)

losses = actual(:).*log(posterior(:)) + ...
    (1-actual(:)).*log(1-posterior(:));
losses(isnan(losses) & ~isinf(losses)) = 0;
score = -mean(losses);