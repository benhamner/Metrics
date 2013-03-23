#!/usr/bin/env python2.7

from setuptools import setup

requirements = [x.strip() for x in open("requirements.txt").readlines()]

setup(name='ml_metrics',
      version='0.1.2',
      description='Machine Learning Evaluation Metrics',
      author = 'Ben Hamner',
      author_email = 'ben@benhamner.com',
      packages = ['ml_metrics', 'ml_metrics.custom'],
      install_requires = requirements)
