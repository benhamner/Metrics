import numpy as np

def ae(actual, predicted):
    return np.abs(np.array(actual)-np.array(predicted))

def ce(actual, predicted):
    return (sum([1.0 for x,y in zip(actual,predicted) if x != y]) /
            len(actual))

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

def ll(actual, predicted):
    actual = np.array(actual)
    predicted = np.array(predicted)
    err = np.seterr(all='ignore')
    score = -(actual*np.log(predicted)+(1-actual)*np.log(1-predicted))
    np.seterr(divide=err['divide'], over=err['over'], under=err['under'], invalid=err['invalid'])
    if type(score)==np.ndarray:
        score[np.isnan(score)] = 0
    else:
        if np.isnan(score):
            score = 0
    return score

def log_loss(actual, predicted):
    return np.mean(ll(actual, predicted))