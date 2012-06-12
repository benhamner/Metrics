function testClassificationError()
%TESTCLASSIFICATIONERROR   Test cases for classificationError
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing classificationError ...');

test_case([1 1 1 0 0 0], [1 1 1 0 0 0], 0);
test_case([1 1 1 0 0 0], [1 1 1 1 0 0], 1/6);
test_case([1 2;3 4], [1 2;3 3], 1/4);
test_case({'cat' 'dog' 'bird'}, {'cat' 'dog' 'fish'}, 1/3);
test_case({'cat' 'dog' 'bird'}, {'caat' 'doog' 'afish'}, 1);

fprintf('tests passed\n');


function test_case(actual, predicted, expected_score)

score = classificationError(actual, predicted);
assert(abs(expected_score-score) < eps);