
import Test.HUnit
import Metrics

testEqual label val1 val2 = TestLabel label (TestCase (assertEqual label val1 val2))

--test1 = TestCase (assertEqual "ae" 0.0 (ae 3.4 3.4)
--test2 = TestCase (assertEqual "ae" 1.0 (ae 2.0 3.0))

--tests = TestList [TestLabel "aeCases" test1, TestLabel "ae2" test2]

tests = TestList [ testEqual "ae" 0.0 (ae 3.4 3.4)
                 , testEqual "se" 0.0 (se 3.4 3.4)
                 , testEqual "se" 4.0 (se 1.0 3.0)
                 , testEqual "ap" 1.0 (apk 3 [1..3] [1..3])
                 ]


main = runTestTT tests
