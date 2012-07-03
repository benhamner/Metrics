#! /usr/bin/env python2.7

import unittest
import ml_metrics as metrics

class TestEditDistance(unittest.TestCase):

    def test_levenshtein_distance(self):
        self.assertEqual(metrics.levenshtein_distance("intention", "execution"), 5)
        self.assertEqual(metrics.levenshtein_distance("sitting", "kitten"), 3) # 3 according to wiki article
        self.assertEqual(metrics.levenshtein_distance("Saturday", "Sunday"), 3) # 3 according to wiki article
        self.assertEqual(metrics.levenshtein_distance("sitting", ""), 7)
        self.assertEqual(metrics.levenshtein_distance("", "Ben"), 3)
        self.assertEqual(metrics.levenshtein_distance("cat", "cat"), 0)
        self.assertEqual(metrics.levenshtein_distance("hat", "cat"), 1)
        self.assertEqual(metrics.levenshtein_distance("at", "cat"), 1)
        self.assertEqual(metrics.levenshtein_distance("", "a"), 1)
        self.assertEqual(metrics.levenshtein_distance("a", ""), 1)
        self.assertEqual(metrics.levenshtein_distance("", ""), 0)
        self.assertEqual(metrics.levenshtein_distance("ant", "aunt"), 1)
        self.assertEqual(metrics.levenshtein_distance("Samantha", "Sam"), 5)
        self.assertEqual(metrics.levenshtein_distance("Flomax", "Volmax"), 3)
        self.assertEqual(metrics.levenshtein_distance([1], [1]), 0)
        self.assertEqual(metrics.levenshtein_distance([1], [1,2]), 1)
        self.assertEqual(metrics.levenshtein_distance([1], [1,10]), 1)
        self.assertEqual(metrics.levenshtein_distance([1,2], [10,20]), 2)
        self.assertEqual(metrics.levenshtein_distance([1,2], [10,20,30]), 3)
        self.assertEqual(metrics.levenshtein_distance([3,3,4], [4,1,4,3]), 3)

if __name__ == '__main__':
    unittest.main()
