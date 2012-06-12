function score = rmse(actual, prediction)
%RMSE   Computes the root mean-squared error between actual and prediction

score = sqrt(mse(actual, prediction));