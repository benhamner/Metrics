function testMSE()
%TESTMAE   Test cases for mean squared error
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing MSE ...');

actual = (0:10)';
posterior = (1:11)';
score = mse(actual, posterior);
assert(abs(1-score) < eps);

actual = [0 .5 1 1.5 2]';
posterior = [0 .5 1 1.5 2]';
score = mse(actual, posterior);
assert(abs(0-score) < eps);

actual = [1 2;3 4];
posterior = [1 2;3 6];
score = mse(actual, posterior);
assert(abs(1-score) < eps);

fprintf('tests passed\n');