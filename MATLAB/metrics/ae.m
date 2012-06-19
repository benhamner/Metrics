function score = ae(actual, prediction)
%AE   Computes the absolute error between actual and prediction
%
%   Author: Ben Hamner (ben@benhamner.com)

score = abs(actual(:)-prediction(:));
