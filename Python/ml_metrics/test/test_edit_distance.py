#! /usr/bin/env python2.7

from __future__ import division
import unittest
import ml_metrics as metrics

class TestEditDistance(unittest.TestCase):

    def test_levenshtein(self):
        self.assertEqual(metrics.levenshtein("intention", "execution"), 5)
        self.assertEqual(metrics.levenshtein("sitting", "kitten"), 3)
        self.assertEqual(metrics.levenshtein("Saturday", "Sunday"), 3)
        self.assertEqual(metrics.levenshtein("sitting", ""), 7)
        self.assertEqual(metrics.levenshtein("", "Ben"), 3)
        self.assertEqual(metrics.levenshtein("cat", "cat"), 0)
        self.assertEqual(metrics.levenshtein("hat", "cat"), 1)
        self.assertEqual(metrics.levenshtein("at", "cat"), 1)
        self.assertEqual(metrics.levenshtein("", "a"), 1)
        self.assertEqual(metrics.levenshtein("a", ""), 1)
        self.assertEqual(metrics.levenshtein("", ""), 0)
        self.assertEqual(metrics.levenshtein("ant", "aunt"), 1)
        self.assertEqual(metrics.levenshtein("Samantha", "Sam"), 5)
        self.assertEqual(metrics.levenshtein("Flomax", "Volmax"), 3)
        self.assertEqual(metrics.levenshtein([1], [1]), 0)
        self.assertEqual(metrics.levenshtein([1], [1,2]), 1)
        self.assertEqual(metrics.levenshtein([1], [1,10]), 1)
        self.assertEqual(metrics.levenshtein([1,2], [10,20]), 2)
        self.assertEqual(metrics.levenshtein([1,2], [10,20,30]), 3)
        self.assertEqual(metrics.levenshtein([3,3,4], [4,1,4,3]), 3)

    def test_levenshtein_normalized(self):
        self.assertEqual(metrics.levenshtein("intention", "execution", True), 5/9)
        self.assertEqual(metrics.levenshtein("sitting", "kitten", normalize=True), 3/7)
        self.assertEqual(metrics.levenshtein("Saturday", "Sunday", True), 3/8)

if __name__ == '__main__':
    unittest.main()
