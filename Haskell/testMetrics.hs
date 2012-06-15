
import Control.Monad (unless)
import Test.HUnit
import Metrics

assertAlmostEqual :: String -> Double -> Double -> Double -> Assertion
assertAlmostEqual preface delta expected actual = 
  unless (abs (expected - actual) < delta) (assertFailure msg)
  where msg = (if null preface then "" else preface ++ "\n") ++
               "expected: " ++ show expected ++ "\n but got: " ++ show actual

delta = 1**(-10)

infinity = -(log 0) -- should be a better way to do this

testEqual label val1 val2 = TestLabel label (TestCase (assertEqual label val1 val2))
testAlmostEqual label val1 val2 = TestLabel label (TestCase (assertAlmostEqual label delta val1 val2))

aeTests = TestList [ testEqual       "ae1" 0.0 (ae 3.4 3.4)
                   , testAlmostEqual "ae2" 1.0 (ae 3.4 4.4)
                   , testEqual       "ae3" 2   (ae 9   11 )
                   ]

apkTests = TestList [ testEqual       "apk1" 0.25 (apk 2 [1..5] [6, 4, 7, 1, 2])
                    , testEqual       "apk2" 0.2 (apk 5 [1..5] [1, 1, 1, 1, 1])
                    , testEqual       "apk3" 1.0 (apk 20 [1..100] ([1..20]++[200..600]))
                    , testAlmostEqual "apk4" (5/6) (apk 3 [1,3] [1..5])
                    , testEqual       "apk5" (1/3) (apk 3 [1..3] [1,1,1])
                    , testEqual       "apk6" (2/3) (apk 3 [1..3] [1,2,1])
                    ]

aucTests = TestList [ testEqual       "auc1" (1/3) (auc [1,0,1,1] [0.32,0.52,0.26,0.86])
                    , testAlmostEqual "auc2" 1 (auc [1,0,1,0,1] [0.9,0.1,0.8,0.1,0.7])
                    , testEqual       "auc3" (1/4)   (auc [0,1,1,0] [0.2,0.1,0.3,0.4])
                    , testEqual       "auc4" 0.5   (auc [1,1,1,1,0,0,0,0,0,0] [1,1,1,1,1,1,1,1,1,1])
                    ]

llTests = TestList [ testEqual       "ll1" 0.0 (ll 1 1)
                   , testEqual       "ll2" infinity (ll 1 0)
                   , testEqual       "ll3" infinity (ll 0 1)
                   , testEqual       "ll4" (- (log 0.5)) (ll 0 0.5)
                   ]

logLossTests = TestList [ testEqual       "logLoss1" 0.0 (logLoss [1, 1, 0, 0] [1, 1, 0, 0])
                        , testEqual       "logLoss2" infinity (logLoss [1, 1, 0, 0] [1, 1, 1, 0])
                        , testEqual       "logLoss3" 1.881797068998267 (logLoss [1, 1, 1, 0, 0, 0] [0.5, 0.1, 0.01, 0.9, 0.75, 0.001])
                        ]

maeTests = TestList [ testEqual       "mae1" 1.0 (mae [0..10] [1..11])
                    , testEqual       "mae2" 0.0 (mae [0,0.5..2] [0,0.5..2])
                    , testEqual       "mae3" 0.25 (mae [1,2,3,4] [1,2,3,5])
                    ]

mapkTests = TestList [ testAlmostEqual "mapk1" (5/6) (mapk 10 [[1..5],[1..3]] [[1..10],[1,2]++[4..11]++[3]])
                     , testEqual       "mapk2" 1.0 (mapk 3 [[1..4]] [[1..4]])
                     , testAlmostEqual "mapk3" 0.685185185185185 (mapk 3 [[1,3,4],[1,2,4],[1,3]] [[1..5],[1..5],[1..5]])
                     , testEqual       "mapk4" 0.26 (mapk 5 [[1..5],[1..5]] [[6,4,7,1,2],[1,1,1,1,1]])
                     , testAlmostEqual "mapk5" (11/18) (mapk 3 [[1,3],[1..3],[1..3]] [[1..5],[1,1,1],[1,2,1]])
                     ]

mseTests = TestList [ testEqual       "mse1" 1.0 (mse [0..10] [1..11])
                    , testEqual       "mse2" 0.0 (mse [0,0.5..2] [0,0.5..2])
                    , testEqual       "mse3" 1.0 (mse [1,2,3,4] [1,2,3,6])
                    ]

msleTests = TestList [ testEqual       "msle1" 1.0 (msle [(exp 2)-1] [exp(1)-1])
                     , testEqual       "msle2" 0.0 (msle [0,0.5..2] [0,0.5..2])
                     , testEqual       "msle3" 0.25 (msle [1,2,3,((exp 1)-1)] [1,2,3,((exp 2)-1)])
                     ]

rmseTests = TestList [ testEqual       "rmse1" 1.0 (rmse [0..10] [1..11])
                     , testEqual       "rmse2" 0.0 (rmse [0,0.5..2] [0,0.5..2])
                     , testEqual       "rmse3" 0.5 (rmse [1,2,3,4] [1,2,3,5])
                     ]

rmsleTests = TestList [ testEqual       "rmsle1" 1.0 (rmsle [(exp 2)-1] [exp(1)-1])
                      , testEqual       "rmsle2" 0.0 (rmsle [0,0.5..2] [0,0.5..2])
                      , testEqual       "rmsle3" 0.5 (rmsle [1,2,3,((exp 1)-1)] [1,2,3,((exp 2)-1)])
                      ]

seTests = TestList [ testEqual       "se1" 0.0 (se 3.4 3.4)
                   , testAlmostEqual "se2" 1.0 (se 3.4 4.4)
                   , testEqual       "se3" 4   (se 9   11 )
                   ]

sleTests = TestList [ testEqual       "sle1" 0.0 (sle 3.4 3.4)
                    , testAlmostEqual "sle2" 1.0 (sle ((exp 2)-1) ((exp 1)-1))
                    ]

allTests = TestList [ aeTests
                    , apkTests
                    , aucTests
                    , llTests
                    , logLossTests
                    , maeTests
                    , mapkTests
                    , mseTests
                    , msleTests
                    , rmseTests
                    , rmsleTests
                    , seTests
                    , sleTests
                    ]

main = runTestTT allTests
