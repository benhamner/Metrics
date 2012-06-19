function testMetrics()
%TESTMETRICS   Runs all test cases for the metrics library
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('TESTING METRICS\n');

testAE;
testAveragePrecisionAtK;
testAUC;
testClassificationError;
testLogLoss;
testQuadraticWeightedKappa;
testMAE;
testMeanAveragePrecisionAtK;
testMSE;
testMSLE;
testRMSE;
testRMSLE;
testSLE;
testSE;

fprintf('ALL TESTS PASSED\n');
