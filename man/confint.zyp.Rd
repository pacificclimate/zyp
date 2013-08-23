\name{confint.zyp}
\alias{confint.zyp}
\title{confint.zyp}
\description{
  Computes a confidence interval on a result from zyp.sen.
}
\usage{
\S3method{confint}{zyp}(object, parm, level = 0.95, \dots)
}

\arguments{
  \item{object}{an object of class zyp, returned by zyp.sen.}

  \item{parm}{unused; for compatibility with confint.}
  
  \item{level}{the confidence level to compute a confidence interval at.}
  
  \item{...}{additional unused arguments.}
}
\details{
  This routine computes a confidence interval on the slope and intercept
  of the result returned by zyp.sen. The confidence interval on the
  slope is calculated using the method defined in (Sen, 1968).
  
  The confidence interval on the intercept is computed by taking the
  standard deviation of the intercepts (sd.i), the z statistic for the given
  confidence level (z), and the mean (m). The confidence level is then:

  \code{c(m - z * sd.i, m + z * sd.i)}
}

\value{A matrix containing the upper and lower bounds of the intersect
  and slope, respectively.
}

\seealso{
\code{\link{zyp.trend.vector}}, \link{zyp-package}.
}
\examples{
x <- c(0, 1, 2, 4, 5)
y <- c(6, 4, 1, 8, 7)
slope <- zyp.sen(y~x)
ci <- confint.zyp(slope)
}
\keyword{ts}
\keyword{robust}
