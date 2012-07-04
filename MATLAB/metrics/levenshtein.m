function score = levenshtein(s1, s2)
% score = levenshtein(s1, s2)
%
% Calculates the area under the ROC for a given set
% of posterior predictions and labels.  Currently limited to two classes.
%
% s1: string
% s2: string
% score: levenshtein distance
%
% Author: Ben Hamner (ben@benhamner.com)

if length(s1) < length(s2)
    score = levenshtein(s2, s1);
elseif isempty(s2)
    score = length(s1);
else
    previous_row = 0:length(s2);
    for i=1:length(s1)
        current_row = 0*previous_row;
        current_row(1) = i;
        for j=1:length(s2)
            insertions = previous_row(j+1) + 1;
            deletions = current_row(j) + 1;
            substitutions = previous_row(j) + (s1(i) ~= s2(j));
            current_row(j+1) = min([insertions, deletions, substitutions]);
        end
        previous_row = current_row;
    end
    score = current_row(end);
end
