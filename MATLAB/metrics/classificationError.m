function score = classificationError(actual, predicted)
%CLASSIFICATIONERROR   Computes the classification error
%   score = classificationError(actual, predicted)
%
%   actual is a vector, matrix, or cell array of class labels
%   predicted is a vector, matrix, or cell array of class labels
%
%   Author: Ben Hamner (ben@benhamner.com)

if iscell(actual)
    is_equal = strcmp(actual(:), predicted(:));
    score = 1 - sum(is_equal)/length(is_equal);
else
    score = 1 - sum(actual(:)==predicted(:))/length(actual(:));
end