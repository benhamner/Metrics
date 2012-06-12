ScoreQuadraticWeightedKappa = function (rater.a , rater.b, 
                                        min.rating,
                                        max.rating) {

    if (missing(min.rating)) {
        min.rating = min(min(rater.a),min(rater.b))
    }
    if (missing(max.rating)) {
        max.rating = max(max(rater.a),max(rater.b))
    }
    
    rater.a = factor(rater.a, levels=min.rating:max.rating)
    rater.b = factor(rater.b, levels=min.rating:max.rating)

    #pairwise frequencies
    confusion.mat = table(data.frame(rater.a, rater.b))
    confusion.mat = confusion.mat / sum(confusion.mat)
    
    #get expected pairwise frequencies under independence
    histogram.a = table(rater.a) / length(table(rater.a))
    histogram.b = table(rater.b) / length(table(rater.b))
    expected.mat = histogram.a %*% t(histogram.b)
    expected.mat = expected.mat / sum(expected.mat)

    #get weights
    labels = as.numeric( as.vector (names(table(rater.a))))
    weights = outer(labels, labels, FUN = function(x,y) (x-y)^2 )

    #calculate kappa
    kappa = 1 - sum(weights*confusion.mat)/sum(weights*expected.mat)
    kappa
}

MeanQuadraticWeightedKappa = function (kappas, weights) {

    if (missing(weights)) {
        weights = rep(1, length(kappas))
    } else {
        weights = weights / mean(weights)
    }

    max999 <- function(x) sign(x)*min(0.999,abs(x))
    min001 <- function(x) sign(x)*max(0.001,abs(x))
    kappas = sapply(kappas, max999)
    kappas = sapply(kappas, min001)
    
    r2z = function(x) 0.5*log((1+x)/(1-x))
    z2r = function(x) (exp(2*x)-1) / (exp(2*x)+1)
    kappas = sapply(kappas, r2z)
    kappas = kappas * weights
    kappas = mean(kappas)
    kappas = z2r(kappas)
    kappas
}
