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


if __name__ == '__main__':
    unittest.main()
