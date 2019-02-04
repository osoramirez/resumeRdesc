#'@title A skewness
#'
#'@description A skewness distribution.
#'@author Oscar Ramirez Alan (\email{osoramirez@@gmail.com}).
#'@param x is a numeric value, could be a  a vector or data.frame
#'@export skew
#'@param na.rm Should missing values be removed.
#'@keywords skew
#'@return A skewness
#'@name skew
#'
#'@examples
#'x<-c(1,1,1,2,3,4,5,6,7,7,7,7,10,10)
#'skew(x)



skew<-function (x, na.rm = FALSE)
{
  if (is.matrix(x))
    apply(x, 2, skew)
  else if (is.vector(x)) {
    if (na.rm)
      x <- x[!is.na(x)]
    n <- length(x)
    (sum((x - mean(x))^3)/n)/(sum((x - mean(x))^2)/n)^(3/2)
  }
  else if (is.data.frame(x))
    sapply(x, skew, skew)
  else skew(as.vector(x))
}


