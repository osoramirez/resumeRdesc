#'@title Geometric mean
#'
#'@description get a geometric mean
#'@author Oscar Ramirez Alan (\email{osoramirez@@gmail.com}).
#'@param x is a numeric value, could be a  a vector or data.frame
#'@export g_mean
#'@param na.rm Should missing values be removed.
#'@keywords g_mean
#'@return a geometric mean
#'@export g_mean
#'@examples
#'x<-rnorm(25,2,3)
#'g_mean(x)
#'

g_mean<-function (x,na.rm = FALSE)
{
  if (is.null(nrow(x))) {
    exp(mean(log(x), na.rm = TRUE))
  }
  else {
    exp(apply(log(x), 2, mean))
  }
}
