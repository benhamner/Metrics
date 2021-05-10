import numpy as np


def apk(actual: list, predicted: list, k=10) -> float:
    """
    Computes the average precision at k.
    This function computes the average precision at k between two lists of
    items.
    Parameters
    ----------
    actual : list
             A list of elements that are to be predicted
    predicted : list
             A list of predicted elements (order does matter)
    k : int, optional
        The maximum number of predicted elements
    Returns
    -------
    score : float
            The average precision at k over the input lists
    """
    if len(predicted) > k:
        predicted = predicted[:k]

    sum_precision = 0.0
    num_hits = 0.0

    for i, prediction in enumerate(predicted):
        if prediction in actual[:k] and prediction not in predicted[:i]:
            num_hits += 1.0
            precision_at_i = num_hits / (i + 1.0)
            sum_precision += precision_at_i

    if num_hits == 0.0:
        return 0.0

    return sum_precision / num_hits


def mapk(actual: list, predicted: list, k=10) -> float:
    """
    Computes the mean average precision at k.

    This function computes the mean average precision at k between two lists
    of lists of items.

    Parameters
    ----------
    actual : list
             A list of lists of elements that are to be predicted 
             (order doesn't matter in the lists)
    predicted : list
                A list of lists of predicted elements
                (order matters in the lists)
    k : int, optional
        The maximum number of predicted elements

    Returns
    -------
    score : double
            The mean average precision at k over the input lists

    """
    return np.mean([apk(a, p, k) for a, p in zip(actual, predicted)])
