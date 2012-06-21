#! /usr/bin/env python2.7

import unittest
import ml_metrics as metrics
import numpy as np

class TestAuc(unittest.TestCase):

    def test_auc(self):
        self.assertAlmostEqual(metrics.auc([1,0,1,1], [.32,.52,.26,.86]), 1.0/3)
        self.assertAlmostEqual(metrics.auc([1,0,1,0,1], [.9,.1,.8,.1,.7]), 1)
        self.assertAlmostEqual(metrics.auc([0,1,1,0], [.2,.1,.3,.4]), 1.0/4)
        self.assertAlmostEqual(metrics.auc([1,1,1,1,0,0,0,0,0,0], 
                                           [1,1,1,1,1,1,1,1,1,1]), 1.0/2)

if __name__ == '__main__':
    unittest.main()
