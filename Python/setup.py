#!/usr/bin/env python

from setuptools import setup

requirements = [x.strip() for x in open("requirements.txt")]

# Automatically run 2to3 for Python 3 support
extra = {}
if sys.version_info >= (3,):
    extra['use_2to3'] = True

setup(name='ml_metrics',
      version='0.1.2',
      description='Machine Learning Evaluation Metrics',
      author = 'Ben Hamner',
      author_email = 'ben@benhamner.com',
      packages = ['ml_metrics', 'ml_metrics.custom'],
      install_requires = requirements,
      **extra)
