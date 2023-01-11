**ml_metrics** is the Python implementation of **Metrics** implementations a library of various supervised machine learning evaluation metrics.

Installation
============

To install from PyPI, you need setuptools<58.0 . 

```
pip install setuptools<58.0
```

```
pip install ml_metrics
```
or 
```
easy_install ml_metrics
```

To install from the source,
```
git clone https://github.com/benhamner/Metrics.git
cd Metrics/Python
python setup.py install
```

Example Usage
=============

```
>>> import ml_metrics as metrics
>>>
>>> metrics.auc([1,1,1,0,0,0], [0.9,0.8,0.4,0.5,0.2,0.1])
0.8888888888888888
>>>
>>> metrics.se(1, 4)
9
```

