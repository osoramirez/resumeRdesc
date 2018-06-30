#'@title A kurtosis
#'
#'@description A skewness distribution,computes the estimator of Pearson's measure of kurtosis.
#'@param x is a numeric value, could be a  a vector, matrix or data.frame
#'@param na.rm Should missing values be removed.
#'@export K
#'@keywords kurtosis
#'@return A kurtosis
#'@name K
#'
#'@examples
#'x<-c(1,1,1,2,3,4,5,6,7,7,7,7,10,10)
#'K(x)


K<-function (x, na.rm = FALSE)
{
  if (is.matrix(x))
    apply(x, 2, K)
  else if (is.vector(x)) {
    if (na.rm)
      x <- x[!is.na(x)]
    n <- length(x)
    n * sum((x - mean(x))^4)/(sum((x - mean(x))^2)^2)
  }
  else if (is.data.frame(x))
    sapply(x,K, K)
  else K(as.vector(x))
}
