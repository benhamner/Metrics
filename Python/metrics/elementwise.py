import numpy as np

def ae(actual, predicted):
    return np.abs(np.array(actual)-np.array(predicted))

def mae(actual, predicted):
    return np.mean(ae(actual, predicted))

def mse(actual, predicted):
    return np.mean(se(actual, predicted))

def msle(actual, predicted):
    return np.mean(sle(actual, predicted))

def rmse(actual, predicted):
    return np.sqrt(mse(actual, predicted))

def rmsle(actual, predicted):
    return np.sqrt(msle(actual, predicted))

def se(actual, predicted):
    return np.power(np.array(actual)-np.array(predicted), 2)

def sle(actual, predicted):
    return (np.power(np.log(np.array(actual)+1) - 
            np.log(np.array(predicted)+1), 2))
