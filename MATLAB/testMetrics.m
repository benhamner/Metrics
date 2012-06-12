function testMetrics()
%TESTMETRICS   Runs all test cases for the metrics library

fprintf('TESTING METRICS\n');

testAveragePrecisionAtK;
testAUC;
testQuadraticWeightedKappa;
testMAE;
testMSE;
testRMSE;

fprintf('ALL TESTS PASSED\n');