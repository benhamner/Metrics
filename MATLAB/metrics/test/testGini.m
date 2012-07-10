function testGini()
%TESTGINI   Test cases for Gini
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing gini ...');

test_case(1:3, [10 20 30], 1/9);
test_case(1:3, [30 20 10], -1/9);
test_case([2,1,4,3], [0,0,2,1], 0.125);

test_case([0,20,40,0,10], [40,40,10,5,5], 0);
test_case([40,0,20,0,10], [1000000 40 40 5 5], 0.17142857);
test_case([40 20 10 0 0], [40 20 10 0 0], 0.28571429);
test_case([1 1 0 1], [0.86 0.26 0.52 0.32], -0.04166667);

fprintf('tests passed\n');


function test_case(actual, prediction, expected_score)

score = gini(actual, prediction);
if abs(expected_score-score) >= 1e-8
    fprintf('\nExpected: %0.12f Predicted: %0.12f\n', expected_score, score);
end
assert(abs(expected_score-score) < 1e-8);