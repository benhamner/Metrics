function testMetrics()
%TESTMETRICS   Runs all test cases for the metrics library

fprintf('TESTING METRICS\n');

testAUC;
testQuadraticWeightedKappa;
testMAE;
testMSE;
testRMSE;

fprintf('ALL TESTS PASSED\n');