#'@title Remove outlier
#'
#'@description remove outlier
#'@author Oscar Ramirez Alan (\email{osoramirez@@gmail.com}).
#'@param x is a numeric value, could be a  a vector or data.frame
#'@param na.rm A logical scalar. Should missing values
#'@param ... Additional arguments
#'@return rmout
#'@export rmout
#'@name rmout
#'@examples
#'set.seed(12345)
#'x <- rnorm(100)
#'x <- c(-15, x, 15)
#'y <- rmout(x)

rmout <- function(x, na.rm = TRUE,...) {
  x <- x[is.finite(x)]
  na.rm = na.rm
  Quan <- quantile(x, probs=c(.25, .75), na.rm = na.rm)
  IQR <- 1.5 * IQR(x, na.rm = na.rm)
  y <- x
  y[x < (Quan[1] - IQR)] <- NA
  y[x > (Quan[2] + IQR)] <- NA
  def.par <- par(no.readonly = TRUE)
  on.exit(par(def.par))
  par(mfrow=c(1,2))
  boxplot(x,col="#EBEBEB", main="With outlier",  boxwex = .85,
          frame.plot = FALSE, cex=0.9, cex.lab=.9, cex.axis=.9, cex.main=.9,cex.main=.9, ylim = c(min(x),  max(x)))
  points(mean(x), pch=20, cex = 1.8)
  boxplot(y,col="#EBEBEB", main="Without outlier",  boxwex = .85,
          frame.plot = FALSE, cex=0.9, cex.lab=.9, cex.axis=.9, cex.main=.9,cex.main=.9, ylim = c(min(x),  max(x)))
  points(mean(x), pch=20, cex = 1.8)
  return(y)
}

