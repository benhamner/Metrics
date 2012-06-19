#! /usr/bin/env python2.7

import unittest
import ml_metrics as metrics
import numpy as np

class TestElementwise(unittest.TestCase):

    def test_ae(self):
        self.assertAlmostEqual(metrics.ae(3.4, 3.4), 0)
        self.assertAlmostEqual(metrics.ae(3.4, 4.4), 1.0)
        self.assertAlmostEqual(metrics.ae(9, 11), 2)
    
    def test_mae(self):
        self.assertAlmostEqual(metrics.mae(range(0,11), range(1,12)), 1)
        self.assertAlmostEqual(metrics.mae([0,.5,1,1.5,2], [0,.5,1,1.5,2]), 0)
        self.assertAlmostEqual(metrics.mae(range(1,5), [1,2,3,5]), 0.25)

    def test_mse(self):
        self.assertAlmostEqual(metrics.mse(range(0,11), range(1,12)), 1)
        self.assertAlmostEqual(metrics.mse([0,.5,1,1.5,2], [0,.5,1,1.5,2]), 0)
        self.assertAlmostEqual(metrics.mse(range(1,5), [1,2,3,6]), 1.0)

    def test_msle(self):
        self.assertAlmostEqual(metrics.msle(np.exp(2)-1,np.exp(1)-1), 1)
        self.assertAlmostEqual(metrics.msle([0,.5,1,1.5,2], [0,.5,1,1.5,2]), 0)
        self.assertAlmostEqual(metrics.msle([1,2,3,np.exp(1)-1], [1,2,3,np.exp(2)-1]), 0.25)

    def test_rmse(self):
        self.assertAlmostEqual(metrics.rmse(range(0,11), range(1,12)), 1)
        self.assertAlmostEqual(metrics.rmse([0,.5,1,1.5,2], [0,.5,1,1.5,2]), 0)
        self.assertAlmostEqual(metrics.rmse(range(1,5), [1,2,3,5]), 0.5)

    def test_rmsle(self):
        self.assertAlmostEqual(metrics.rmsle(np.exp(2)-1,np.exp(1)-1), 1)
        self.assertAlmostEqual(metrics.rmsle([0,.5,1,1.5,2], [0,.5,1,1.5,2]), 0)
        self.assertAlmostEqual(metrics.rmsle([1,2,3,np.exp(1)-1], [1,2,3,np.exp(2)-1]), 0.5)

    def test_se(self):
        self.assertAlmostEqual(metrics.se(3.4, 3.4), 0)
        self.assertAlmostEqual(metrics.se(3.4, 4.4), 1.0)
        self.assertAlmostEqual(metrics.se(9, 11), 4)

    def test_sle(self):
        self.assertAlmostEqual(metrics.sle(3.4, 3.4), 0)
        self.assertAlmostEqual(metrics.sle(np.exp(2)-1, np.exp(1)-1), 1.0)

if __name__ == '__main__':
    unittest.main()
