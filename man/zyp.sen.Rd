\name{zyp.sen}
\alias{zyp.sen}
\title{zyp.sen}
\description{
  Computes a Thiel-Sen estimate of slope for a vector of data.
}
\usage{
zyp.sen(formula, dataframe)
}
\arguments{
  \item{formula}{a formula of the form y~x.}

  \item{dataframe}{an optional data frame to use with the formula.}
}
\details{
  This routine computes Sen's estimate of slope for a vector of data.
  
  The formula specified is of the form y~x, where y is the data and x is
  the accompanying dates of observation.
  
  If a data frame is specified, the formula selects columns within that
  data frame; otherwise, the formula uses the specified variables.
}

\value{A vector containing the coefficients and associated data.
  \item{coefficients}{the estimated intercept and slope.}
  \item{slopes}{the list of slopes (used for confidence intervals).}
  \item{intercepts}{the list of intercepts (used for confidence intervals.}
  \item{rank}{the rank of the relation (2).}
  \item{residuals}{the residuals of the fitted slope.}
  \item{x}{the original x axis data.}
  \item{y}{the original y axis data.}
}

\seealso{
\code{\link{zyp.trend.vector}}, \link{zyp-package}, \link{confint.zyp}.
}
\examples{
x <- c(0, 1, 2, 4, 5)
y <- c(6, 4, 1, 8, 7)
slope <- zyp.sen(y~x)
}
\keyword{ts}
\keyword{robust}
