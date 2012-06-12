function testRMSLE()
%TESTRMSLE   Test cases for mean squared log error
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing RMSLE ...');

test_case(exp(2)-1,exp(1)-1,1);
test_case([0 .5 1 1.5 2],[0 .5 1 1.5 2], 0);
test_case([1 2;3 exp(1)-1], [1 2;3 exp(2)-1], 0.5);

fprintf('tests passed\n');


function test_case(actual, prediction, expected_score)

score = rmsle(actual, prediction);
assert(abs(expected_score-score) < eps);