#! /usr/bin/env python2.7

import numpy as np

class EvaluationMetrics(object):
    def __init__(is_max=True):
        self.is_max = is_max

    def score