function testMeanAveragePrecisionAtK()
%TESTMEANAVERAGEPRECISIONATK   Test cases for MAP@K
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing meanAveragePrecisionAtK ...');

actual = {(1:5) [1 2 3]};
prediction = {(1:10) [1 2 4:11 3]};
score = meanAveragePrecisionAtK(actual, prediction);
assert(abs(5/6-score) < eps);

test_case({1:4}, {1:4}, 3, 1.0);
test_case({[1 3 4] [1 2 4] [1 3]}, {1:5 1:5 1:5}, 3, 0.685185185185185);
test_case({1:5 1:5}, {[6 4 7 1 2] [1 1 1 1 1]}, 5, 0.26);
test_case({[1 3] 1:3 1:3}, {1:5 [1 1 1] [1 2 1]}, 3, 11/18);

fprintf('tests passed\n');


function test_case(actual, prediction, k, expected_score)

score = meanAveragePrecisionAtK(actual, prediction, k);
assert(abs(expected_score-score) < eps);