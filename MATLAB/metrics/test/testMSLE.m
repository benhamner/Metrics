function testMSLE()
%TESTMAE   Test cases for mean squared log error
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing MSLE ...');

test_case(exp(2)-1,exp(1)-1,1);
test_case([0 .5 1 1.5 2],[0 .5 1 1.5 2], 0);
test_case([1 2;3 exp(1)-1], [1 2;3 exp(2)-1], 0.25);

fprintf('tests passed\n');


function test_case(actual, prediction, expected_score)

score = msle(actual, prediction);
assert(abs(expected_score-score) < eps);