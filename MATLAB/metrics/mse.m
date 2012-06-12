function score = mse(actual, prediction)
%MSE   Computes the mean-squared error between actual and prediction

score = mean((actual(:)-prediction(:)).^2);