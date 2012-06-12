function testMetrics()
%TESTMETRICS   Runs all test cases for the metrics library
%
%   Author: Ben Hamner (ben@benhamner.com)

fprintf('TESTING METRICS\n');

testAveragePrecisionAtK;
testAUC;
testLogLoss;
testQuadraticWeightedKappa;
testMAE;
testMeanAveragePrecisionAtK;
testMSE;
testMSLE;
testRMSE;
testRMSLE;

fprintf('ALL TESTS PASSED\n');