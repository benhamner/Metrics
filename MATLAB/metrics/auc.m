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

r = tiedrank(posterior);
auc = (sum(r(category==1)) - sum(category==1)*(sum(category==1)+1)/2) / ...
    ( sum(category<1)*sum(category==1));
