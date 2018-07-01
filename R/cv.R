#'@title coefficient of variation
#'
#'@description Compute the coefficient of variation
#'@param x is a numeric value, could be a  a vector or data.frame
#'@export cv
#'@keywords cv
#'@return cv
#'@export cv
#'
#'@examples
#'set.seed(12345)
#'x<-rnorm(25,2,3)
#'cv(x)
#'

cv <- function(x)
{
  options(digits=3)
  data <- na.omit(x)
  sqrt(var(data,na.rm=TRUE))/mean(data,na.rm=TRUE)
  }


