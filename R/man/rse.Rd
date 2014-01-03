\name{rse}
\alias{rse}
\title{Compute the relative squared error}
\usage{
  rse(actual, predicted)
}
\arguments{
  \item{actual}{ground truth vector}

  \item{predicted}{predicted vector}
}
\description{
  This function computes the relative squared error between two vectors.
  The relative squared error is relative to what it would have been
  if a simple predictor had been used. This simple predictor is
  just the average of the actual values, as described in Witten et al. (2011).
}
\references{
  Witten, Ian H, Eibe Frank, and Mark Hall (2011). Data Mining: Practical
  Machine Learning Tools and Techniques. 3rd ed. Morgan Kaufman, p. 180.
}
