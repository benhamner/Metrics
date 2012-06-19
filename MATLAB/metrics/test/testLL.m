function testLL()
%TESTLL   Test cases for log loss
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing LL ...');

score = ll(1, 1);
assert(abs(0-score) < 10*eps);

score = ll(1, 0);
assert(score == Inf);

score = ll(0, 1);
assert(score == Inf);

score = ll(0, 0.5);
assert(abs(-log(0.5)-score) < 10*eps);

fprintf('tests passed\n');
