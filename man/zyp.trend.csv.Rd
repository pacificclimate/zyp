\name{zyp.trend.csv}
\alias{zyp.trend.csv}
\alias{zyp.trend.dataframe}
\title{zyp.trend.csv}
\description{
  Computes prewhitened nonlinear trends on CSV files or data frames with 0 to n columns of
  metadata, with 1 row per location and each column containing data for
  a particular time (day, month, year). The zyp package allows you to
  use either Zhang's method, or the Yue Pilon method of computing
  nonlinear prewhitened trends.
}
\usage{
zyp.trend.dataframe(indat, metadata.cols, method=c("yuepilon", "zhang"),
                    conf.intervals=TRUE, preserve.range.for.sig.test=TRUE)
zyp.trend.csv(filename, output.filename, metadata.cols,
              method=c("yuepilon", "zhang"), conf.intervals=TRUE,
              csv.header=TRUE, preserve.range.for.sig.test=TRUE)
}
\arguments{
  \item{indat}{the input data frame.}

  \item{filename}{the filename of the input CSV file.}

  \item{output.filename}{the filename to write output to.}

  \item{metadata.cols}{the number of columns of metadata.}

  \item{method}{the prewhitened trend method to use.}

  \item{conf.intervals}{whether to compute a 95 percent confidence
  interval based on all possible slopes.}

  \item{preserve.range.for.sig.test}{whether to re-inflate values by
  dividing by (1 - ac) following removal of autocorrelation prior to
  computation of significance.}

  \item{csv.header}{whether the input CSV file has a header.}
}
\details{
  These routines compute prewhitened nonlinear trends on either CSV
  files with or without a header or data frames with 0 to n columns of
  metadata (which is preserved in the output). Each row is expected to
  contain metadata followed by a timeseries, and all rows are expected
  to have the same length of timeseries. NA values are handled
  correctly, so if you have several timeseries of unequal length you can
  pad them with NA values to provide valid input.

  The prewhitened trend computation methods used are either Zhang's
  method (described in Wang and Swail, 2001) or Yue and Pilon's method
  (described in Yue and Pilon, 2002).
}

\value{A data frame containing the trends, in the case of
  zyp.trend.dataframe. Columns of the output are as follows.
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
\code{\link{zyp.trend.vector}}, \link{zyp-package}.
}
\examples{
#zyp.trend.csv("in.csv", "out.csv", 2, "yuepilon", F)
#trends <- zyp.trend.dataframe(indat, 2, "yuepilon")
}
\keyword{ts}
\keyword{robust}

