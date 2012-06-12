function testMetrics()
%TESTMETRICS   Runs all test cases for the metrics library

fprintf('TESTING METRICS\n');

testAveragePrecisionAtK;
testAUC;
testQuadraticWeightedKappa;
testMAE;
testMeanAveragePrecisionAtK;
testMSE;
testMSLE;
testRMSE;
testRMSLE;

fprintf('ALL TESTS PASSED\n');