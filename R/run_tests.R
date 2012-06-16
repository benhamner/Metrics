library('RUnit')

source('metrics.R')

test.suite <- defineTestSuite("quadratic weighted kappa",
                              dirs = file.path("tests"),
                              testFileRegexp = '^\\d+\\.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)
