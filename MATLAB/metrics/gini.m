function score = gini(actual, predicted)
% score = gini(category,posterior)
%
% Calculates the gini score
%
% actual: n*1 matrix of actual values
% predicted: n*1 matrix of predicted values
% score: gini score
%
% Author: Ben Hamner (ben@benhamner.com)

[~,I] = sort(-predicted);

population_delta = 1 / length(actual);
accumulated_population_percentage_sum = 0;
accumulated_loss_percentage_sum = 0;
score = 0;
total_losses = sum(actual);

for i=1:length(actual)
    loc = I(i);
    accumulated_loss_percentage_sum = accumulated_loss_percentage_sum + ...
        actual(loc) / total_losses;
    accumulated_population_percentage_sum = accumulated_population_percentage_sum ...
        + population_delta;
    score = score + accumulated_loss_percentage_sum - accumulated_population_percentage_sum;
end

score = score / length(actual);