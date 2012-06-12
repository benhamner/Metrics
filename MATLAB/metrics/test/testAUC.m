function testAUC()
%TESTAUC   Test cases for area under the ROC curve
%   evaluation metric
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing AUC ...');

actual = [1; 0; 1; 1];
posterior = [0.32; 0.52; 0.26; 0.86];
score = auc(actual, posterior);
assert(abs(1/3-score) < eps);

actual = [1; 0; 1; 0; 1];
posterior = [0.9 0.1 0.8 0.1 0.7]';
score = auc(actual, posterior);
assert(abs(1-score) < eps);

actual = [0 1 1 0]';
posterior = [0.2 0.1 0.3 0.4];
score = auc(actual, posterior);
assert(abs(1/4-score) < eps);

actual = [1 1 1 1 0 0 0 0 0 0 0]';
posterior = ones(size(actual));
score = auc(actual, posterior);
assert(abs(1/2-score) < eps);

fprintf('AUC tests passed\n');