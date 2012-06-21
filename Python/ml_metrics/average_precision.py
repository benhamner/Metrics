import numpy as np

def apk(actual, prediction, k=10):
    if len(prediction)>k:
        prediction = prediction[:k]

    score = 0.0
    num_hits = 0.0

    for i,p in enumerate(prediction):
        if p in actual and p not in prediction[:i]:
            num_hits += 1.0
            score += num_hits / (i+1.0)

    return score / min(len(actual), k)

def mapk(actual, predictions, k=10):
    return np.mean([apk(a,p,k) for a,p in zip(actual, predictions)])