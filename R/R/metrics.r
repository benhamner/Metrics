#' Compute the squared error
#'
#' This function computes the elementwise squared error for a
#' number or a vector
#'
#' @param actual ground truth number or vector
#' @param predicted predicted number or vector
#' @export
se <- function (actual, predicted) (actual-predicted)^2

#' Compute the mean squared error#'
#' This function computes the mean squared error between
#' two vectors
#'
#' @param actual ground truth vector
#' @param predicted predicted vector
#' @export
mse <- function (actual, predicted) mean(se(actual, predicted))

#' Compute the root mean squared error#'
#' This function computes the root mean squared error
#' between two vectors
#'
#' @param actual ground truth vector
#' @param predicted predicted vector
#' @export
rmse <- function (actual, predicted) sqrt(mse(actual, predicted))

#' Compute the absolute error#'
#' This function computes the elementwise absolute error for a
#' number or a vector
#'
#' @param actual ground truth number or vector
#' @param predicted predicted number or vector
#' @export
ae <- function (actual, predicted) abs(actual-predicted)

#' Compute the mean absolute error#'
#' This function computes the mean absolte error between
#' two vectors
#'
#' @param actual ground truth vector
#' @param predicted vector
#' @export
mae <- function (actual, predicted) mean(ae(actual, predicted))

#' Compute the squared log error
#'
#' This function computes the elementwise squared log error for a
#' number or a vector
#'
#' @param actual ground truth number or vector
#' @param predicted predicted number or vector
#' @export
sle <- function (actual, predicted) (log(1+actual)-log(1+predicted))^2

#' Compute the mean squared log error
#'
#' This function computes the mean squared log error between
#' two vectors
#'
#' @param actual ground truth vector
#' @param predicted predicted vector
#' @export
msle <- function (actual, predicted) mean(sle(actual, predicted))

#' Compute the root mean squared log error
#'
#' This function computes the root mean squared log error between
#' two vectors
#'
#' @param actual ground truth vector
#' @param predicted predicted vector
#' @export
rmsle <- function (actual, predicted) sqrt(msle(actual, predicted))

#' Compute the area under the ROC (AUC)
#'
#' This function computes the area under the receiver-operator
#' characteristic (AUC)
#'
#' @param actual binary vector
#' @param predicted real-valued vector that defines the ranking
#' @export
auc <- function(actual, predicted)
{
    r <- rank(predicted)
    n_pos <- sum(actual==1)
    n_neg <- length(actual) - n_pos
    auc <- (sum(r[actual==1]) - n_pos*(n_pos+1)/2) / (n_pos*n_neg)
    auc
}

#' Compute the log loss
#'
#' This function computes the elementwise log loss for a
#' number or a vector
#'
#' @param actual binary ground truth number or vector
#' @param predicted predicted number or vector
#' @export
ll <- function(actual, predicted)
{
    score <- -(actual*log(predicted) + (1-actual)*log(1-predicted))
    score[actual==predicted] <- 0
    score[is.nan(score)] <- Inf
    score
}

#' Compute the mean log loss
#'
#' This function computes the mean log loss between
#' two vectors
#'
#' @param actual binary ground truth vector
#' @param predicted predicted vector
#' @export
logLoss <- function(actual, predicted) mean(ll(actual, predicted))

#' Compute the average precision at k
#'
#' This function computes the average precision at k
#' between two sequences
#'
#' @param k max length of predicted sequence
#' @param actual ground truth set (vector)
#' @param predicted predicted sequence (vector)
#' @export
apk <- function(k, actual, predicted)
{
    score <- 0.0
    cnt <- 0.0
    for (i in 1:min(k,length(predicted)))
    {
        if (predicted[i] %in% actual && !(predicted[i] %in% predicted[0:(i-1)]))
        {
            cnt <- cnt + 1
            score <- score + cnt/i 
        }
    }
    score <- score / min(length(actual), k)
    score
}

#' Compute the mean average precision at k
#'
#' This function computes the mean average precision at k
#' of two lists of sequences.
#'
#' @param k max length of predicted sequence
#' @param actual list of ground truth sets (vectors)
#' @param predicted list of predicted sequences (vectors)
#' @export
mapk <- function (k, actual, predicted)
{
    scores <- rep(0, length(actual))
    for (i in 1:length(scores))
    {
        scores[i] <- apk(k, actual[[i]], predicted[[i]])
    }
    score <- mean(scores)
    score
}

#' Compute the classification error
#'
#' This function computes the classification error
#' between two vectors
#'
#' @param actual ground truth vector
#' @param predicted predicted vector
#' @export
ce <- function (actual, predicted)
{
    cntError <- 0.0
    for (i in 1:length(actual))
    {
        if (actual[i] != predicted[i])
        {
            cntError <- cntError + 1
        }
    }

    score = cntError / length(actual)
    score
}

#' Compute the quadratic weighted kappa
#'
#' This function computes the quadratic weighted kappa
#' between two vectors of integers
#'
#' @param rater.a is the first rater's ratings
#' @param rater.b is the second rater's ratings
#' @param min.rating is the minimum possible rating
#' @param max.rating is the maximum possible rating
#' @export
ScoreQuadraticWeightedKappa <- function (rater.a , rater.b, 
                                        min.rating,
                                        max.rating) {

    if (missing(min.rating)) {
        min.rating <- min(min(rater.a),min(rater.b))
    }
    if (missing(max.rating)) {
        max.rating <- max(max(rater.a),max(rater.b))
    }
    
    rater.a <- factor(rater.a, levels<-min.rating:max.rating)
    rater.b <- factor(rater.b, levels<-min.rating:max.rating)

    #pairwise frequencies
    confusion.mat <- table(data.frame(rater.a, rater.b))
    confusion.mat <- confusion.mat / sum(confusion.mat)
    
    #get expected pairwise frequencies under independence
    histogram.a <- table(rater.a) / length(table(rater.a))
    histogram.b <- table(rater.b) / length(table(rater.b))
    expected.mat <- histogram.a %*% t(histogram.b)
    expected.mat <- expected.mat / sum(expected.mat)

    #get weights
    labels <- as.numeric( as.vector (names(table(rater.a))))
    weights <- outer(labels, labels, FUN <- function(x,y) (x-y)^2 )

    #calculate kappa
    kappa <- 1 - sum(weights*confusion.mat)/sum(weights*expected.mat)
    kappa
}

#' Compute the mean quadratic weighted kappa
#'
#' This function computes the mean quadratic weighted
#' kappa, which can optionally be weighted
#'
#' @param kappas is a vector of possible kappas
#' @param weights is an optional vector of ratings
#' @export
MeanQuadraticWeightedKappa <- function (kappas, weights) {

    if (missing(weights)) {
        weights <- rep(1, length(kappas))
    } else {
        weights <- weights / mean(weights)
    }

    max999 <- function(x) sign(x)*min(0.999,abs(x))
    min001 <- function(x) sign(x)*max(0.001,abs(x))
    kappas <- sapply(kappas, max999)
    kappas <- sapply(kappas, min001)
    
    r2z <- function(x) 0.5*log((1+x)/(1-x))
    z2r <- function(x) (exp(2*x)-1) / (exp(2*x)+1)
    kappas <- sapply(kappas, r2z)
    kappas <- kappas * weights
    kappas <- mean(kappas)
    kappas <- z2r(kappas)
    kappas
}
