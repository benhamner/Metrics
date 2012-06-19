function testSLE()
%TESTSLE   Test cases for squared log error
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing SLE ...');

score = sle(3.4, 3.4);
assert(abs(0-score) < eps);

score = sle(exp(2)-1, exp(1)-1);
assert(abs(1-score) < eps);

fprintf('tests passed\n');
