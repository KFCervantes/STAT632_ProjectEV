library(magrittr)
library(stringr)

# load in data
data <- "Dataset/Cheapestelectriccars-EVDatabase.csv" %>%
  read.csv

# convert selected columns to float
data[c("Subtitle", "Acceleration")] %<>%
  
  # define new function and apply it on every value in the column
  lapply(
    
    # x is the string
    function (x)
      x %>%
      
      # keep substring consisting of digits and decimal points
      str_extract("[\\.\\d]+") %>%
      
      # convert string to float
      as.numeric
  )

# convert selected columns to int
data[c("TopSpeed", "Range", "Efficiency", "FastChargeSpeed", "PriceinGermany", "PriceinUK")] %<>%
  
  # define new function and apply it on every value in the column
  lapply(
    
    # x is the string
    function (x)
      x %>%
      
      # remove comma from string
      str_remove(",") %>%
      
      # keep substring consisting of digits
      str_extract("\\d+") %>%
      
      # convert string to int
      as.integer
  )
