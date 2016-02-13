#! /usr/bin/env python2.7

import unittest
import ml_metrics as metrics
import numpy as np

class TestAveragePrecision(unittest.TestCase):

    def test_apk(self):
        self.assertAlmostEqual(metrics.apk(range(1,6),[6,4,7,1,2], 2), 0.25)
        self.assertAlmostEqual(metrics.apk(range(1,6),[1,1,1,1,1], 5), 0.2)
        predicted = list(range(1,21))
        predicted.extend(range(200,600))
        self.assertAlmostEqual(metrics.apk(range(1,100),predicted, 20), 1.0)
        # numpy array test
        self.assertAlmostEqual(metrics.apk(np.asarray(range(1,100)),predicted, 20), 1.0)
        self.assertAlmostEqual(metrics.apk(range(1,100), np.asarray(predicted), 20), 1.0)


    def test_apk_empties(self):
        self.assertAlmostEqual(metrics.apk([], [1, 3], 20), 0.0)
        self.assertAlmostEqual(metrics.apk(None, [1, 2], 20), 0.0)
        self.assertAlmostEqual(metrics.apk([1, 3], [], 20), 0.0)
        self.assertAlmostEqual(metrics.apk([1, 2], None, 20), 0.0)


    def test_mapk(self):
        self.assertAlmostEqual(metrics.mapk([range(1,5)],[range(1,5)],3), 1.0)
        self.assertAlmostEqual(metrics.mapk([[1,3,4],[1,2,4],[1,3]],
            [range(1,6),range(1,6),range(1,6)], 3), 0.685185185185185)
        self.assertAlmostEqual(metrics.mapk([range(1,6),range(1,6)],
            [[6,4,7,1,2],[1,1,1,1,1]], 5), 0.26)
        self.assertAlmostEqual(metrics.mapk([[1,3],[1,2,3],[1,2,3]],
            [range(1,6),[1,1,1],[1,2,1]], 3), 11.0/18)

if __name__ == '__main__':
    unittest.main()
