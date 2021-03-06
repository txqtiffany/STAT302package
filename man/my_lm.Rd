% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_lm.R
\name{my_lm}
\alias{my_lm}
\title{Fitting Linear Models}
\usage{
my_lm(formula, data)
}
\arguments{
\item{formula}{a \code{formula} class object, similar to \code{lm()}.}

\item{data}{input data frame.}
}
\value{
a table with rows for each coefficient and columns for the
Estimate, Std. Error, t value, and Pr(>|t|).
}
\description{
This function is used to fit linear models in R.
}
\examples{
my_lm(formula = mpg ~ hp + wt, data = mtcars)

}
\keyword{inference,}
\keyword{perdiction}
