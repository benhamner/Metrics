function testMAE()
%TESTMAE   Test cases for mean absolute error
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing MAE ...');

actual = (0:10)';
posterior = (1:11)';
score = mae(actual, posterior);
assert(abs(1-score) < eps);

actual = [0 .5 1 1.5 2]';
posterior = [0 .5 1 1.5 2]';
score = mae(actual, posterior);
assert(abs(0-score) < eps);

actual = [1 2;3 4];
posterior = [1 2;3 5];
score = mae(actual, posterior);
assert(abs(0.25-score) < eps);

fprintf('tests passed\n');