#! /usr/bin/env python2.7

import unittest
import ml_metrics as metrics

class Testquadratic_weighted_kappa(unittest.TestCase):

    def test_confusion_matrix(self):
        conf_mat = metrics.confusion_matrix([1,2],[1,2])
        self.assertEqual(conf_mat,[[1,0],[0,1]])
        
        conf_mat = metrics.confusion_matrix([1,2],[1,2],0,2)
        self.assertEqual(conf_mat,[[0,0,0],[0,1,0],[0,0,1]])
        
        conf_mat = metrics.confusion_matrix([1,1,2,2,4],[1,1,3,3,5])
        self.assertEqual(conf_mat,[[2,0,0,0,0],[0,0,2,0,0],[0,0,0,0,0],
                                   [0,0,0,0,1],[0,0,0,0,0]])
        
        conf_mat = metrics.confusion_matrix([1,2],[1,2],1,4)
        self.assertEqual(conf_mat,[[1,0,0,0],[0,1,0,0],[0,0,0,0],[0,0,0,0]])

    def test_quadratic_weighted_kappa(self):
        kappa = metrics.quadratic_weighted_kappa([1,2,3],[1,2,3])
        self.assertAlmostEqual(kappa, 1.0)

        kappa = metrics.quadratic_weighted_kappa([1,2,1],[1,2,2],1,2)
        self.assertAlmostEqual(kappa, 0.4)

        kappa = metrics.quadratic_weighted_kappa([1,2,3,1,2,2,3],[1,2,3,1,2,3,2])
        self.assertAlmostEqual(kappa, 0.75)
    
    # todo: test cases for linear_weighted_kappa

    def test_mean_quadratic_weighted_kappa(self):
        kappa = metrics.mean_quadratic_weighted_kappa([1, 1])
        self.assertAlmostEqual(kappa, 0.999)

        kappa = metrics.mean_quadratic_weighted_kappa([0.5, 0.8], [1,.5])
        self.assertAlmostEqual(kappa, 0.624536446425734)

        kappa = metrics.mean_quadratic_weighted_kappa([-1, 1])
        self.assertAlmostEqual(kappa, 0.0)

if __name__ == '__main__':
    unittest.main()
