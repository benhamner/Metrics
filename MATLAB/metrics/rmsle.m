function score = rmsle(actual, prediction)
%RMSLE   Computes the root mean squared log error between
%   actual and prediction
%   score = rmsle(actual, prediction)
%
%   Author: Ben Hamner (ben@benhamner.com)

score = sqrt(msle(actual, prediction));