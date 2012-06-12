function testMetrics()
%TESTMETRICS   Runs all test cases for the metrics library

fprintf('TESTING METRICS\n');

testQuadraticWeightedKappa;
testAUC;

fprintf('ALL TESTS PASSED\n');