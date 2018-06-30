#'@title Mode
#'
#'@description get a Mode
#'@param x is a numeric value, could be a  a vector or data.frame
#'@return Mode
#'@export Mode
#'@keywords Mode
#'@name Mode
#'@examples
#'x<-c(1,1,1,2,3,4,5,6,7,8,9,9,9,9,9)
#'Mode(x)
#'x2<-c(1,1,1,1,1,2,3,4,5,6,7,8,9,9,9,9,9)
#'Mode(x2)
#'


Mode<-function (x)
{
  if (!is.atomic(x) | is.matrix(x))
    stop("Supports only vectors.")
    x <- x[!is.na(x)]
  tab <- table(x)
  res <- names(which(tab == max(tab)))
  if (!inherits(x, "factor"))
    class(res) <- class(x)
  return(as.vector(res))
}

