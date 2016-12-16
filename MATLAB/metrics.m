function score=metrics(metric_name, actual, predicted, varargin)
%METRICS Calculates evaluation metrics commonly used in machine learning
%
%   metrics(metric_name, actual, predicted, varargin)
%   Example: metrics('ap@k', actual, predicted, k)
%
%   Author: Ben Hamner (ben@benhamner.com)
% add one test from haifeng 

switch lower(metric_name)
    case 'ae'
        score = ae(actual, predicted);
    case 'averageprecisionatk'
        if isempty(varargin)
            score = averagePrecisionAtK(actual, predicted);
        else
            score = averagePrecisionAtK(actual, predicted, varargin{1});
        end
    case 'ap@k'
        if isempty(varargin)
            score = averagePrecisionAtK(actual, predicted);
        else
            score = averagePrecisionAtK(actual, predicted, varargin{1});
        end    
    case 'auc'
        score = auc(actual, predicted);
    case 'classificationerror'
        score = classificationError(actual, predicted);
    case 'levenshtein'
        score = levenshtein(actual, predicted);
    case 'll'
        score = ll(actual, predicted);
    case 'logloss'
        score = logLoss(actual, predicted);
    case 'quadraticweightedkappa'
        if isempty(varargin)
            score = quadraticWeightedKappa(actual, predicted);
        else
            score = quadraticWeightedKappa(actual, predicted, ...
                varargin{1}, varargin{2});
        end
    case 'qwk'
        if isempty(varargin)
            score = quadraticWeightedKappa(actual, predicted);
        else
            score = quadraticWeightedKappa(actual, predicted, ...
                varargin{1}, varargin{2});
        end
    case 'mae'
        score = mae(actual, predicted);
    case 'meanabsoluteerror'
        score = mae(actual, predicted);
    case 'meanaverageprecisionatk'
        if isempty(varargin)
            score = meanAveragePrecisionAtK(actual, predicted);
        else
            score = meanAveragePrecisionAtK(actual, predicted, varargin{1});
        end
    case 'map@k'
        if isempty(varargin)
            score = meanAveragePrecisionAtK(actual, predicted);
        else
            score = meanAveragePrecisionAtK(actual, predicted, varargin{1});
        end   
    case 'mse'
        score = mse(actual, predicted);
    case 'meansquarederror'
        score = mse(actual, predicted);
    case 'msle'
        score = msle(actual, predicted);
    case 'meansquaredlogerror'
        score = msle(actual, predicted);
    case 'rmse'
        score = rmse(actual, predicted);
    case 'rootmeansquarederror'
        score = rmse(actual, predicted);
    case 'rmsle'
        score = rmsle(actual, predicted);
    case 'rootmeansquaredlogerror'
        score = rmsle(actual, predicted);
    case 'se'
        score = se(actual, predicted);
    case 'sle'
        score = sle(actual, predicted);
end
