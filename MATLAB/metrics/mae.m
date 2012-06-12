function score = mae(actual, prediction)
%MAE   Computes the mean absolute error between actual and prediction
%
%   Author: Ben Hamner (ben@benhamner.com)

score = mean(abs(actual(:)-prediction(:)));
