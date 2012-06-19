**Metrics** provides implementations of various supervised machine learning evaluation metrics in the following languages:
 
 - [**Python**](https://github.com/benhamner/Metrics/tree/master/Python)
 - [**R**](https://github.com/benhamner/Metrics/tree/master/R)
 - [**Haskell**](https://github.com/benhamner/Metrics/tree/master/Haskell)
 - [**MATLAB / Octave**](https://github.com/benhamner/Metrics/tree/master/MATLAB)

EVALUATION METRICS
------------------

<table>
<tr><td>Evaluation Metric</td><td>Python</td><td>R</td>
<td>Haskell</td><td>MATLAB / Octave</td></tr>
<tr><td>Absolute Error (AE)</td><td>&#10003;</td><td>&#10003;</td>td>&#10003;</td><td></td></tr>
<tr><td>Average Precision at K (APK, AP@K) </td><td></td><td></td>td>&#10003;</td><td>&#10003;</td></tr>
<tr><td>Area Under the ROC (AUC)</td><td></td><td>&#10003;</td>td>&#10003;</td><td>&#10003;</td></tr>
</table>

 - AE (H, P, R)
 - AveragePrecisionAtK (M, H)
 - AUC (M, H, R)
 - ClassificationError (M, H)
 - LL (H, R)
 - LogLoss (M, H, R)
 - MAE (M, H, P, R)
 - MeanAveragePrecisionAtK (M, H)
 - MeanQuadraticWeightedKappa (M, P, R)
 - MSLE (M, H, P, R)
 - MSE (M, H, P, R)
 - QuadraticWeightedKappa (M, P, R)
 - RMSE (M, H, P, R)
 - RMSLE (M, H, P, R)
 - SE (H, P, R)
 - SLE (H, P, R)

FULLY IMPLEMENTED
-----------------

TO IMPLEMENT
------------

 - Gini
 - NormalizedGini
 - LevensteinDistance

PROPERTIES METRICS CAN HAVE
---------------------------

 - Min or Max (optimize through minimization or maximization)
 - Binary Classification
   - Scores predicted class labels
   - Scores predicted ranking (most likeley to least likely for being in one class)
   - Scores predicted probabilities
 - Multiclass Classification
   - Scores predicted class labels
   - Scores predicted probabilities
 - Regression
 - Discrete Rater Comparison (confusion matrix)

