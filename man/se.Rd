% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/se.R
\name{se}
\alias{se}
\title{A standard error}
\usage{
se(x)
}
\arguments{
\item{x}{is a numeric value, could be a  a vector or data.frame}

\item{se}{get a standard error}
}
\value{
a data a standard error
}
\description{
The standard error (SE) of a statistic is the standard deviation of its sampling distribution.
}
\examples{
x<-rnorm(25,2,3)
se(x)

}
\author{
Oscar Ramirez Alan (\email{osoramirez@gmail.com}).
}
