#'@title Summary Statitical Data
#'
#'@description Get a complete descriptive summary statistics
#'@param x is a numeric value, could be a  a vector or data.frame
#'@export resume
#'
#'@keywords resume
#'@return a summary
#'@import "graphics","stats"
#'@examples
#'set.seed(12345)
#'x<-rnorm(25,2,3)
#'resume(x)
#'

resume<-function (x)
{
  options(digits=3)
  x <- x[is.finite(x)]
  def.par <- par(no.readonly = TRUE)
  on.exit(par(def.par))
  par(mfrow=c(2,2))
  hist(x, main = NULL, col = "#EDEDED", xlab = "", prob = TRUE, cex=.9)
  abline(v = mean(x), lwd = 3, col="red")
  abline(v = median(x), col = "#3F689E", lwd = 2.5,lty=2)
  rug(x)
  lines(density(x), lwd = 1.75)
  legend(x = "topright", pch = 1, title = "Legend",box.lty=0,cex=.7,bg="transparent",
         c("Mean", "Median"),
         col = c( "red", "#3F689E"),
         lwd = c(2, 2), lty=c(1,2))
  x0 <- NULL
  curve(dnorm(x, mean(x), sd(x)), add = TRUE, col = "red")
  title(main = "Histogram and density")
  boxplot(x, col = "#EDEDED", lwd = 0.5,  boxwex = .85, frame.plot = FALSE)
  points(mean(x), pch=20, cex = 1.8)
  axis(side = 1)
  title(main="Standard\nBoxplot")
  qqnorm (x, main = "Quantile-quantile plot")
  n <- length(x)
  shapi <- shapiro.test(x)
  shapiW <- round(shapi$statistic, 3)
  shapiP <- round(shapi$p.value, 3)
  x1 <- shapiP
  x2<-if(x1 > 0.05){
    print("You got Normal distribution.")
  } else {
    print("You got Asymmetrical Distribution")
  }
  Mean<-round(mean(x, na.rm = TRUE), 3)
  Sd<-round(sd(x, na.rm = TRUE), 3)
  Median <- round(median(x, na.rm = TRUE), 3)
  Max <- round(max(x, na.rm = TRUE), 3)
  Min <- round(min(x, na.rm = TRUE), 3)
  ci<-.95
  error <- qt(ci + (1 - ci)/2, df = n - 1) * Sd/sqrt(n)
  lwr.ci1<-Mean - error
  lwr.ci<-round(lwr.ci1,2)
  upr.ci1 = Mean + error
  upr.ci<-round(upr.ci1,2)
  outlier<-boxplot(x, plot = FALSE)$out
  out2<-unlist(outlier, recursive = TRUE)
  x3<-if(n > 30){
    print("You got a good sample size (n>=30)")
  } else {
    print("Warning: You have a low sample size (n<30)")
  }
 x4 <-if (length(out2) == 0){  print("You do not have outlier")
  } else {
    print("Warning: You  have outlier")
  }
  par(mar = rep(1, 4))
  plot.new()
  text(cex=.95, x = 0.5, y = 0.5, paste("DESCRIPTIVE", "\nSample size: n=",n,
                                        sep = "", "\nMean=", as.numeric(Mean),
                                        "  sd=", as.numeric(Sd),"\nMedian=", as.numeric(Median),
                                        "\nMax=", as.numeric(Max),
                                        "   Min=", as.numeric(Min),
                                        "\nConfident.Intervals= ", as.numeric(lwr.ci), " - ", as.numeric(upr.ci),
                                        "\nShapiro-Wilk test:  P-value=", as.character(shapiP),
                                        "\nDistr.=", as.character(x2), "\n", as.character(x3)))
}
