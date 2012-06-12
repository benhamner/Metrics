function score = mae(actual, prediction)
%MAE   Computes the mean absolute error between actual and prediction

score = mean(abs(actual(:)-prediction(:)));