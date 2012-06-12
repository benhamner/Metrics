function testLogLoss()
%TESTLOGLOSS   Test cases for logLoss
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing logLoss ...');

test_case([1 1 1 0 0 0], [.5 .1 .01 .9 .75 .001], 1.881797068998267);
test_case([1 1 1 0 0 0], [1 1 1 0 0 0], 0);

score = logLoss([1 1 0 0], [1 0 0 0]);
assert(score == Inf);

fprintf('tests passed\n');


function test_case(actual, prediction, expected_score)

score = logLoss(actual, prediction);
assert(abs(expected_score-score) < eps);