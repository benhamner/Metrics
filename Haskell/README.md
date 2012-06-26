**Metrics** provides simple access to commonly used evaluation metrics in machine learning.

Installation
============

To install or update, run the following from the command prompt (with latest version of the Haskell Platform installed).

```
cabal install Metrics
```

Example Usage
=============

```
ghci >import Metrics
ghci >
ghci >auc [1,1,1,0,0,0] [0.9,0.8,0.4,0.5,0.2,0.1]
0.8888888888888888
ghci >
ghci >se 1 4
9
```
