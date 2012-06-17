library('RUnit')

source('metrics.R')

test.suite <- defineTestSuite("Metrics",
                              dirs = file.path("tests"),
                              testFileRegexp = '^.+\\.R')

test.result <- runTestSuite(test.suite)

printTextProtocol(test.result)
