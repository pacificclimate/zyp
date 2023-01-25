\name{zyp.trend.vector}
\alias{zyp.trend.vector}
\alias{zyp.zhang}
\alias{zyp.yuepilon}
\title{zyp.trend.vector}
\description{
  Computes a prewhitened linear trend on a vector of data. The 'zyp'
  package  allows you to use either Zhang's method, or the Yue Pilon
  method of computing nonlinear prewhitened trends.
}
\usage{
zyp.trend.vector(y, x=1:length(y), method=c("zhang", "yuepilon"),
conf.intervals=TRUE, preserve.range.for.sig.test=FALSE)
zyp.zhang(y, x=1:length(y), conf.intervals=TRUE, preserve.range.for.sig.test=FALSE)
zyp.yuepilon(y, x=1:length(y), conf.intervals=TRUE, preserve.range.for.sig.test=FALSE)
}
\arguments{
  \item{y}{vector of input data.}

  \item{x}{vector of time data (optional).}

  \item{method}{the prewhitened trend method to use.}

  \item{conf.intervals}{whether to compute a 95 percent confidence
  interval based on all possible slopes.}

  \item{preserve.range.for.sig.test}{whether to re-inflate values by
  dividing by (1 - ac) following removal of autocorrelation prior to
  computation of significance.}
}
\details{
  This routine computes a prewhitened nonlinear trend on a vector of
  data, using either Zhang's (described in Wang and Swail, 2001) or
  Yue Pilon's (describe in Yue Pilon, 2002) method of prewhitening and
  Sen's slope, and use a Kendall test for significance.
}

\value{A vector containing the trend and associated data.
  \item{lbound}{the lower bound of the trend's confidence interval.}
  \item{trend}{the Sen's slope (trend) per unit time.}
  \item{trendp}{the Sen's slope (trend) over the time period.}
  \item{ubound}{the upper bound of the trend's confidence interval.}
  \item{tau}{Kendall's tau statistic computed on the final detrended timeseries.}
  \item{sig}{Kendall's P-value computed for the final detrended timeseries.}
  \item{nruns}{the number of runs required to converge upon a trend.}
  \item{autocor}{the autocorrelation of the final detrended timeseries.}
  \item{valid_frac}{the fraction of the data which is valid (not NA)
  once autocorrelation is removed.}
  \item{linear}{the least squares fit trend on the same dat.}
  \item{intercept}{the intercept of the Sen's slope (trend).}
  \item{lbound_intercept}{the lower bound of the estimate of the intercept of the Sen's slope (trend).}
  \item{ubound_intercept}{the upper bound of the estimate of the intercept of the Sen's slope (trend).}

}

\seealso{
\code{\link{zyp.trend.csv}}, \link{zyp-package}, \link{confint.zyp}, \link{zyp.sen}.
}
\examples{
# Without confidence intervals, using the wrapper routine
d <- zyp.trend.vector(c(0, 1, 3, 4, 2, 5), conf.intervals=FALSE)

# With confidence intervals, using the wrapper routine
d <- zyp.trend.vector(c(0, 1, 3, 4, 2, 5))

# With confidence intervals, not using the wrapper routine
d.zhang <- zyp.zhang(c(0, 1, 3, 4, 2, 5))
d.yuepilon <- zyp.yuepilon(c(0, 1, 3, 4, 2, 5))

# With confidence intervals, with time data.
t.dat <- c(0, 0.3, 1, 3, 3.4, 6)
d <- zyp.trend.vector(c(0, 1, 3, 4, 2, 5), t.dat, method="yuepilon")
d.zhang <- zyp.zhang(c(0, 1, 3, 4, 2, 5), t.dat)
d.yuepilon <- zyp.yuepilon(c(0, 1, 3, 4, 2, 5), t.dat)
}
\keyword{ts}
\keyword{robust}
