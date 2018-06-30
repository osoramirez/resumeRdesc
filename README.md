
<!-- README.md is generated from README.Rmd. Please edit that file -->
resumeR
=======

The goal of resumeR is to get a entire summary statistic.

You have installed resumeR on your R system, version 3.4.4 or later “<https://cran.r-project.org/>”. Works better in Rstudio “<https://www.rstudio.com>”

Installation
------------

You can install the released version of resumeR from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("resumeR"). Not yet available
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("osoramirez/resumeR")
```

Example
-------

Activate the resumeR package:

``` r
library(resumeR)
#> Loading required package: e1071
#> Loading required package: car
#> Loading required package: carData
```

You could requiere “e1071”; “car” and “carData” package

This is a basic example which shows you how to solve a common problem:

``` r
set.seed(12345)
data<-rnorm(100)
resume(rnorm(100))
#> [1] "You got Normal distribution."
#> [1] "You got a good sample size (n>=30)"
#> [1] "Warning: You  have outlier"
```

<img src="man/figures/README-example-1.png" width="100%" />

Get a complete summary table, histogram and boxplot of your distribution data.

``` r
resume2data(data)
```

<img src="man/figures/README-Histogram and boxplot-1.png" width="100%" />

    #> This function shows summary statistics.
    #>                   It includes measures of central tendency,
    #>                   measures of variability,
    #>                   and measures of shape.
    #> [[1]]
    #> NULL
    #> 
    #> [[2]]
    #>                Size (n)                 Missing                 Minimum 
    #>               100.00000                 0.00000                -2.38000 
    #>                  1st Qu                  Median                  3st Qu 
    #>                -0.59000                 0.48400                 0.90000 
    #>                     Max                    Mean                      sd 
    #>                 2.47700                 0.24500                 1.11500 
    #>                     Var                 SE Mean                  TrMean 
    #>                 1.24300                 0.11200                 0.25800 
    #>                     IQR                   Range                Kurtosis 
    #>                 1.49000                 4.85700                -0.61000 
    #>                Skewness                      CV                 CI.Mean 
    #>                -0.14000                 4.55102                 0.00704 
    #>                  lwr.ci                  upr.ci                     Sum 
    #>                 0.02000                 0.47000                24.51972 
    #>      Shapiro.test p-val 
    #>                 0.24200

If you are interested in exploring the distribution of your data using a histogram, use “plothist”.

``` r
plothist(data)
```

<img src="man/figures/README-histogram-1.png" width="100%" />

    #> This option performs a histogram that show your data has mean of  0.245  and  1.115  of standar desviation. Your median is  0.484  in  100  samples data. Check all your statistical data, using function: resume2data.

You can also embed boxplot, for example:

``` r
plotbox(data)
```

<img src="man/figures/README-boxplot-1.png" width="100%" />

    #>    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    #>  -2.380  -0.590   0.484   0.245   0.900   2.477

Coefficient of variation
------------------------

A coefficient of variation (cv) is a statistical measure of the dispersion of data points in a data series around the mean.

``` r
cv(data)
#> [1] 4.55
```

Geometric mean
--------------

The geometric mean is a mean or average, which indicates the central tendency

``` r
g_mean(data)
#> Warning in log(x): NaNs produced
#> [1] 0.751
```

Harmonic mean
-------------

The harmonic mean is a very specific type of average. It’s generally used when dealing with averages of units, like speed or other rates and ratios. Its a reciprocals of the numbers in your data set or it is calculated by dividing the number of observations by the reciprocal of each number in the series.

``` r
h_mean(data)
#> [1] 1.32
```

Mode
----

The "Mode" is the value that occurs most often. If no number in the list is repeated.

``` r
data2<-c(1,1,1,2,3,4,5,6,7,8,9)
Mode(data2)
#> [1] 1
```

Standard error
--------------

Is as a measure of the precision of the sample mean, it is considered as a measures of spread.

``` r
se(data)
#> [1] 0.112
#> mean= 0.245±0.112 =standard error
```

summaries for data.frame
========================

For your data.frame data use this functions.

``` r
data(iris)
resumendf(Petal.Width ~Species, data = iris)
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

    #>             n  Mean    sd Median Min Max 1st Qu 3st Qu     se Missing
    #> setosa     50 0.246 0.105    0.2 0.1 0.6    0.2     0.3 0.015       0
    #> versicolor 50 1.326 0.198    1.3 1.0 1.8    1.2     1.5 0.028       0
    #> virginica  50 2.026 0.275    2.0 1.4 2.5    1.8     2.3 0.039       0

Reference
=========

Coefficient Of Variation (CV) <https://www.investopedia.com/terms/c/coefficientofvariation.asp#ixzz5Ibl3v4Ly>

Read more: Harmonic Mean <https://www.investopedia.com/terms/h/harmonicaverage.asp#ixzz5Ibmy4Rbq>

Read more: Standard error <https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1255808/>
# resumeRdesc
