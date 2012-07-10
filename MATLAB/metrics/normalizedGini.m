function score = normalizedGini(actual, predicted)
% score = normalizedGini(category,posterior)
%
% Calculates the normalized gini score
%
% actual: n*1 matrix of actual values
% predicted: n*1 matrix of predicted values
% score: normalized gini score
%
% Author: Ben Hamner (ben@benhamner.com)

score = gini(actual, predicted) / gini(actual, actual);