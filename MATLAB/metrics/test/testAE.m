function testAE()
%TESTAE   Test cases for absolute error
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing AE ...');

score = ae(3.4, 3.4);
assert(abs(0-score) < 10*eps);

score = ae(3.4, 4.4);
assert(abs(1-score) < 10*eps);

score = ae(9, 11);
assert(abs(2-score) < 10*eps);

fprintf('tests passed\n');
