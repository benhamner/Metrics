function auc = auc(category,posterior)
% auc = scoreAUC(category,posterior)
%
% Calculates the area under the ROC for a given set
% of posterior predictions and labels.  Currently limited to two classes.
%
% posterior: n*1 matrix of posterior probabilities for class 1
% category: n*1 matrix of categories {0,1}
% auc: Area under the curve
%
% Author: Ben Hamner (ben@benhamner.com)
%
% Algorithm found in
% A  Simple Generalisation of the Area Under the ROC
% Curve for Multiple Class Classification Problems
% David Hand and Robert Till
% http://www.springerlink.com/content/nn141j42838n7u21/fulltext.pdf

if exist('tiedrank')
    r = tiedrank(posterior);
else
    r = tiedrank_metrics(posterior);
end
auc = (sum(r(category==1)) - sum(category==1)*(sum(category==1)+1)/2) / ...
    ( sum(category<1)*sum(category==1));

function r = tiedrank_metrics(x)

[~,I] = sort(x);

r = 0*x;
cur_val = x(I(1));
last_pos = 1;

for i=1:length(I)
    if cur_val ~= x(I(i))
        r(I(last_pos:i-1)) = (last_pos+i-1)/2;
        last_pos = i;
        cur_val = x(I(i));
    end
    if i==length(I)
        r(I(last_pos:i)) = (last_pos+i)/2;
    end
end