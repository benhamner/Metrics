function testLevenshtein()
%TESTLEVENSHTEIN   Test cases for area under the ROC curve
%   evaluation metric
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('Testing Levenshtein ...');

assert(levenshtein('intention', 'execution') == 5)
assert(levenshtein('sitting', 'kitten') == 3)
assert(levenshtein('Saturday', 'Sunday') == 3)
assert(levenshtein('sitting', '') == 7)
assert(levenshtein('', 'Ben') == 3)
assert(levenshtein('cat', 'cat') == 0)
assert(levenshtein('hat', 'cat') == 1)
assert(levenshtein('at', 'cat') == 1)
assert(levenshtein('', 'a') == 1)
assert(levenshtein('a', '') == 1)
assert(levenshtein('', '') == 0)
assert(levenshtein('ant', 'aunt') == 1)
assert(levenshtein('Samantha', 'Sam') == 5)
assert(levenshtein('Flomax', 'Volmax') == 3)
assert(levenshtein([1], [1]) == 0)
assert(levenshtein([1], [1,2]) == 1)
assert(levenshtein([1], [1,10]) == 1)
assert(levenshtein([1,2], [10,20]) == 2)
assert(levenshtein([1,2], [10,20,30]) == 3)
assert(levenshtein([3,3,4], [4,1,4,3]) == 3)

fprintf('tests passed\n');