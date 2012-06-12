function score = msle(actual, prediction)
%MSLE   Computes the mean squared log error between actual and prediction
%
%   Author: Ben Hamner (ben@benhamner.com)

score = mean((log(1+actual(:))-log(1+prediction(:))).^2);