function score = rmse(actual, prediction)
%RMSE   Computes the root mean-squared error between actual and prediction
%
%   Author: Ben Hamner (ben@benhamner.com)

score = sqrt(mse(actual, prediction));
