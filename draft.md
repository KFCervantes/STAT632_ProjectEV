Draft
================
2022-04-11

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
before doing linear regression.

``` r
data %>%
  select_if(is.numeric) %>%
  drop_na %>%
  cor %>%
  kable
```

|                 |   Subtitle | Acceleration |   TopSpeed |      Range | Efficiency | FastChargeSpeed | NumberofSeats | PriceinGermany |  PriceinUK |
|:----------------|-----------:|-------------:|-----------:|-----------:|-----------:|----------------:|--------------:|---------------:|-----------:|
| Subtitle        |  1.0000000 |   -0.6520589 |  0.6855154 |  0.9110421 |  0.4226688 |       0.6023019 |     0.0810309 |      0.6458824 |  0.7039080 |
| Acceleration    | -0.6520589 |    1.0000000 | -0.8353629 | -0.7022077 | -0.0300939 |      -0.7113489 |     0.3086190 |     -0.6782980 | -0.7086397 |
| TopSpeed        |  0.6855154 |   -0.8353629 |  1.0000000 |  0.7434964 |  0.0781084 |       0.7357284 |    -0.2195802 |      0.8322625 |  0.8650237 |
| Range           |  0.9110421 |   -0.7022077 |  0.7434964 |  1.0000000 |  0.0449622 |       0.7227111 |    -0.0653115 |      0.6179583 |  0.6843999 |
| Efficiency      |  0.4226688 |   -0.0300939 |  0.0781084 |  0.0449622 |  1.0000000 |      -0.0264225 |     0.4409032 |      0.3005908 |  0.3053173 |
| FastChargeSpeed |  0.6023019 |   -0.7113489 |  0.7357284 |  0.7227111 | -0.0264225 |       1.0000000 |    -0.1651635 |      0.6248566 |  0.6495690 |
| NumberofSeats   |  0.0810309 |    0.3086190 | -0.2195802 | -0.0653115 |  0.4409032 |      -0.1651635 |     1.0000000 |     -0.1907867 | -0.1491998 |
| PriceinGermany  |  0.6458824 |   -0.6782980 |  0.8322625 |  0.6179583 |  0.3005908 |       0.6248566 |    -0.1907867 |      1.0000000 |  0.9841777 |
| PriceinUK       |  0.7039080 |   -0.7086397 |  0.8650237 |  0.6843999 |  0.3053173 |       0.6495690 |    -0.1491998 |      0.9841777 |  1.0000000 |
