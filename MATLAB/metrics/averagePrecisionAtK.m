function score = averagePrecisionAtK(actual, prediction, k)
%AVERAGEPRECISIONATK   Calculates the average precision at k
%   score = averagePrecisionAtK(actual, prediction, k)
%
%   actual is a vector
%   prediction is a vector
%   k is an integer
%
%   Author: Ben Hamner (ben@benhamner.com)

if nargin<3
    k=10;
end

if length(prediction)>k
    prediction = prediction(1:k);
end

score = 0;
num_hits = 0;
for i=1:min(length(prediction), k)
    if sum(actual==prediction(i))>0 && ...
            sum(prediction(1:i-1)==prediction(i))==0
        num_hits = num_hits + 1;
        score = score + num_hits / i;
    end
end

score = score / min(length(actual), k);