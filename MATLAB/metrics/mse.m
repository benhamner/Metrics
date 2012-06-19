function score = mse(actual, prediction)
%MSE   Computes the mean-squared error between actual and prediction
%
%   Author: Ben Hamner (ben@benhamner.com)

score = mean(se(actual,prediction));
