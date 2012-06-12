function testQuadraticWeightedKappa()
%TESTQUADRATICWEIGHTEDKAPPA   Test cases for quadratic weighted kappa
%   testQuadraticWeightedKappa evaluates the quadraticWeightedKappa
%   and meanQuadraticWeightedKappa functions
%
%   Author: Ben Hamner (ben@benhamner.com)

% Tests for scoreQuadraticWeightedKappa

fprintf('Testing Quadratic Weighted Kappa ... ');

X = [1 1;2 2;3 3];
kappa = quadraticWeightedKappa(X(:,1), X(:,2));
assert(abs(1.0-kappa) < eps);

X = [1 1;2 2;1 2];
kappa = quadraticWeightedKappa(X(:,1), X(:,2), 1, 2);
assert(abs(0.4-kappa) < eps);

X = [1 1;2 2;3 3;1 1;2 2;2 3;3 2];
kappa = quadraticWeightedKappa(X(:,1), X(:,2));
assert(abs(0.75-kappa) < eps);

% Tests for meanQuadraticWeightedKappa
kappa = meanQuadraticWeightedKappa([1.0 1.0]);
assert(abs(0.999-kappa) < eps);

kappa = meanQuadraticWeightedKappa([-1.0 1.0]);
assert(abs(0.0-kappa) < eps);

kappa = meanQuadraticWeightedKappa([0.5 0.8], [1.0, 0.5]);
assert(abs(0.624536446425734-kappa) < eps);

fprintf('tests passed\n');