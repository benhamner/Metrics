function score = se(actual, prediction)
%SE   Computes the squared error between actual and prediction
%
%   Author: Ben Hamner (ben@benhamner.com)

score = (actual(:)-prediction(:)).^2;
