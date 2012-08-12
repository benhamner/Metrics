import numpy as np

def capped_log10_likelihood(actual, predicted):
    """
    Computes the capped log10 likelihood, predictions in (0.01, 0.99).

    This function computes the log likelihood between two numbers,
    or for element between a pair of lists or numpy arrays.

    Parameters
    ----------
    actual : int, float, list of numbers, numpy array
             The ground truth value
    predicted : same type as actual
                The predicted value

    Returns
    -------
    score : double or list of doubles
            The log likelihood error between actual and predicted

    """
    actual = np.array(actual)
    predicted = np.array(predicted)
    predicted[predicted<0.01]=0.01
    predicted[predicted>0.99]=0.99

    score = -(actual*np.log10(predicted)+(1-actual)*np.log10(1-predicted))
    
    if type(score)==np.ndarray:
        score[np.isnan(score)] = 0
    else:
        if np.isnan(score):
            score = 0
    return score

def capped_binomial_deviance(actual, predicted):
    """
    Computes the capped binomial deviance.

    This function computes the log loss between two lists
    of numbers.

    Parameters
    ----------
    actual : list of numbers, numpy array
             The ground truth value
    predicted : same type as actual
                The predicted value

    Returns
    -------
    score : double
            The log loss between actual and predicted

    """
    return np.mean(capped_log10_likelihood(actual, predicted))