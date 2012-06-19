function score = sle(actual, prediction)
%MSLE   Computes the squared log error between actual and prediction
%
%   Author: Ben Hamner (ben@benhamner.com)

score = (log(1+actual(:))-log(1+prediction(:))).^2;
