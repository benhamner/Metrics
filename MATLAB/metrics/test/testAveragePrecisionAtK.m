function testAveragePrecisionAtK()
%TESTAVERAGEPRECISIONATK   Test cases for AP@K
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing averagePrecisionAtK ...');

actual = 1:5;
prediction = 1:10;
score = averagePrecisionAtK(actual, prediction);
assert(abs(1-score) < eps);

test_case(1:5, [6 4 7 1 2], 2, 0.25);
test_case(1:5, [1 1 1 1 1], 5, 0.2);
test_case(1:100, [1:20 200:600], 20, 1);
test_case([1 3], 1:5, 3, 5/6);
test_case([1 2 3], [1 1 1], 3, 1/3);
test_case([1 2 3], [1 2 1], 3, 2/3);

fprintf('tests passed\n');


function test_case(actual, prediction, k, expected_score)

score = averagePrecisionAtK(actual, prediction, k);
assert(abs(expected_score-score) < eps);