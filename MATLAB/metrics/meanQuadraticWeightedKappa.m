function kappa = meanQuadraticWeightedKappa(kappas, weights)
%MEANQUADRATICWEIGHTEDKAPPA   Mean of kappas in the z-space
%   meanQuadraticWeightedKappa calculates the mean of the quadratic
%   weighted kappas after applying Fisher's r-to-z transform, which is
%   approximately a variance-stabilizing transformation.  This
%   transformation is undefined if one of the kappas is 1.0, so all kappa
%   values are capped in the range (-0.999, 0.999).  The reverse
%   transformation is then applied before returning the result.
%
%   meanQuadraticWeightedKappa(kappas), where kappas is a vector of kappa
%   values
%
%   meanQuadraticWeightedKappa(kappas, weights), where weights is a vector
%   of weights that is the same size as kappas.  Weights are applied in the
%   z-space.
%
%   Author: Ben Hamner (ben@benhamner.com)

if nargin==1
    weights = ones(size(kappas));
else
    weights = weights / mean(weights);
end

% Cap kappas to the range (-0.999, 0.999) to prevent an undefined result
kappas = min(kappas, 0.999);
kappas = max(kappas, -.999);

z = 0.5 * log( (1+kappas) ./ (1-kappas) ) .* weights;
z = mean(z);
kappa = (exp(2*z)-1) / (exp(2*z)+1);