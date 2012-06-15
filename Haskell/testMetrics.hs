
import Control.Monad (unless)
import Test.HUnit
import Metrics

assertAlmostEqual :: String  -- ^ The message prefix
                     -> Double  -- ^ The maximum difference between expected and actual
                     -> Double  -- ^ The expected value
                     -> Double  -- ^ The actual value
                     -> Assertion
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
                    , llTests
                    , logLossTests
                    , maeTests
                    , mseTests
                    , msleTests
                    , rmseTests
                    , rmsleTests
                    , seTests
                    , sleTests
                    ]

main = runTestTT allTests
