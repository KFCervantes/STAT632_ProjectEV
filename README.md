# STAT632_ProjectEV

The dataset we used was the “Cheapest Electric Cars” from Kaggle user KOUSTUBHK. This user scraped data from https://ev-database.org/ in August 2021. The dataset contains 180 rows and 11 columns.

Here is a short description of each column:

* `Name`

    This is the name of the vehicle and will not be used in any of the formulas. However it is helpful as an identifier so will be kept in the data.

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

    This is the drivetrains category of the electric vehicle.

* `NumberofSeats`

    This is the number of seats in the vehicle.

* `FastChargeSpeed`

    This column describes whether the electric vehicle supports fast charging or not.
   
* `PriceinGermany`

    This is the price of the car in Germany.

* `PriceinUK`

    This is the price of the car in the United Kingdom.

Some of these columns are stored as strings, but clearly contain numeric substrings that may be useful. Some of these strings have the value “-” which indicates a null value. As such, these will be converted to `NA` when the numeric parts are parsed out.
