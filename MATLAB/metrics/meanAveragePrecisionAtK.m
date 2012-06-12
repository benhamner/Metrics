function score = meanAveragePrecisionAtK(actual, prediction, k)
%MEANAVERAGEPRECISIONATK   Calculates the average precision at k
%   score = meanAveragePrecisionAtK(actual, prediction, k)
%
%   actual is a cell array of vectors
%   prediction is a cell array of vectors
%   k is an integer
%
%   Author: Ben Hamner (ben@benhamner.com)

if nargin<3
    k=10;
end

scores = zeros(length(prediction),1);

for i=1:length(prediction)
    scores(i) = averagePrecisionAtK(actual{i}, prediction{i}, k);
end

score = mean(scores);