\name{rae}
\alias{rae}
\title{Compute the relative absolute error}
\usage{
  rae(actual, predicted)
}
\arguments{
  \item{actual}{ground truth vector}

  \item{predicted}{predicted vector}
}
\description{
  This function computes the relative absolute error between two vectors.
  The relative absolute error is just the total absolute error,
  normalized by the error of the simple predictor that predicts
  the average values, as described in Witten et al. (2011).
}
\references{
  Witten, Ian H, Eibe Frank, and Mark Hall (2011). Data Mining: Practical
  Machine Learning Tools and Techniques. 3rd ed. Morgan Kaufman, p. 180.
}
