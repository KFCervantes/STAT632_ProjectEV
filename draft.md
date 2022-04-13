Draft
================
2022-04-13

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(ggplot2)
library(knitr)
library(magrittr)
library(tidyr)
```

    ## 
    ## Attaching package: 'tidyr'

    ## The following object is masked from 'package:magrittr':
    ## 
    ##     extract

``` r
data <- "Dataset/cleaned_data.csv" %>%
  read.csv
```

This document is meant to draft out stuff and select variables.

First, variables will need to be selected. In order to do this, a
correlation matrix will be used to pick which variables will be kept
before doing linear regression. For our purposes, we will define highly
correlated as having an absolute correlation higher than 0.7.

``` r
data %>%
  select_if(is.numeric) %>%
  cor(use = "pairwise.complete.obs") %>%
  kable
```

|                 |   Subtitle | Acceleration |   TopSpeed |      Range | Efficiency | FastChargeSpeed | NumberofSeats | PriceinGermany |  PriceinUK |
|:----------------|-----------:|-------------:|-----------:|-----------:|-----------:|----------------:|--------------:|---------------:|-----------:|
| Subtitle        |  1.0000000 |   -0.6229854 |  0.6914155 |  0.8900925 |  0.3564261 |       0.6242536 |     0.1344473 |      0.6532906 |  0.7172076 |
| Acceleration    | -0.6229854 |    1.0000000 | -0.8210411 | -0.7120771 |  0.1409840 |      -0.7305042 |     0.3183015 |     -0.5558902 | -0.6643481 |
| TopSpeed        |  0.6914155 |   -0.8210411 |  1.0000000 |  0.7603190 | -0.0473835 |       0.7669064 |    -0.2425673 |      0.7533304 |  0.8577265 |
| Range           |  0.8900925 |   -0.7120771 |  0.7603190 |  1.0000000 | -0.0722725 |       0.7424490 |    -0.0688511 |      0.6247187 |  0.6866690 |
| Efficiency      |  0.3564261 |    0.1409840 | -0.0473835 | -0.0722725 |  1.0000000 |      -0.0961505 |     0.6024685 |      0.2435185 |  0.3375505 |
| FastChargeSpeed |  0.6242536 |   -0.7305042 |  0.7669064 |  0.7424490 | -0.0961505 |       1.0000000 |    -0.2456947 |      0.6045257 |  0.6505508 |
| NumberofSeats   |  0.1344473 |    0.3183015 | -0.2425673 | -0.0688511 |  0.6024685 |      -0.2456947 |     1.0000000 |     -0.0460184 | -0.0597642 |
| PriceinGermany  |  0.6532906 |   -0.5558902 |  0.7533304 |  0.6247187 |  0.2435185 |       0.6045257 |    -0.0460184 |      1.0000000 |  0.9846736 |
| PriceinUK       |  0.7172076 |   -0.6643481 |  0.8577265 |  0.6866690 |  0.3375505 |       0.6505508 |    -0.0597642 |      0.9846736 |  1.0000000 |

From this matrix, we can see that `PriceinUK` is highly correlated with
the following:

-   `Subtitle`

-   `TopSpeed`

-   `PriceinGermany`

`PriceinGermany` may be considered a different version of the response,
but `Subtitle` and `TopSpeed` may be significant predictors. For this
reason, other predictors correlated with these may be dropped. These
predictors are:

-   `Range`

-   `Acceleration`

-   `FastChargeSpeed`

Next a scatterplot matrix will be used to find potential
transformations.

``` r
(PriceinUK ~ .) %>%
  pairs(
    data %>%
      select_if(is.numeric) %>%
      select(-c("PriceinGermany", "Range", "Acceleration", "FastChargeSpeed"))
  )
```

![](draft_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->
