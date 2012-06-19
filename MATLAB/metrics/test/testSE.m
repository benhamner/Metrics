function testSE()
%TESTSE   Test cases for squared error
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing SE ...');

score = se(3.4, 3.4);
assert(abs(0-score) < 10*eps);

score = se(3.4, 4.4);
assert(abs(1-score) < 10*eps);

score = se(9, 11);
assert(abs(4-score) < 10*eps);

fprintf('tests passed\n');
