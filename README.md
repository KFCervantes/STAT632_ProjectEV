# STAT632_ProjectEV

The dataset we used was the “Cheapest Electric Cars” from Kaggle user KOUSTUBHK. This user scraped data from https://ev-database.org/ in August 2021. The dataset contains 180 rows and 11 columns.

The column `Name` is the name of the vehicle and will not be used in any of the formulas. However it is helpful as an identifier so will be kept in the data.

The columns:

* `Subtitle`


    This column contanins information about the type of electric vehicle as well as the kWh of the battery. The kWh part of the column gives information about the battery capacity of the car.

* `Acceleration`

    This is the amount of time it takes the car to get to a speed of 100 km/h from 0 km/h.

* `TopSpeed`

    This is the maximum speed the vehicle can travel.

* `Range`

    This is the maximum distance the car can travel on a full charge.

* `Efficiency`

* `Drive`

* `NumberofSeats`  

* `FastChargeSpeed`

    This column describes whether the electric car supports fast charging or not.
   
* `PriceinGermany`

* `PriceinUK`

All are stored as strings, but clearly contain numeric substrings that may be useful. Some of these strings have the value “-” which indicates a null value. As such, these will be converted to NA.
