library(tidyverse)
library(lubridate)

filepath <- ".//Datasets//wfpvam_foodprices.csv"
readdata <- read.csv(filepath,header = TRUE)
##backUpdata <- readdata

## Filtering data available since January 2019 to till date and inretail market sector
filterData <- filter(readdata,(mp_year > "2018" & pt_name == "Retail"))

## Drop un-necessary columns
drop.cols <- c("adm0_id","adm1_name","adm1_id","mkt_id","cur_id","pt_id","pt_name","cm_id","mp_commoditysource","um_id")
filterData <- select (filterData,-all_of(drop.cols))
filterData <- rename(filterData,c('country_name' = 'adm0_name'))
## Bassas the India is India
filterData$country_name[which(filterData$country_name == "Bassas da India")] <- "India"
countries <- unique(filterData$adm0_name)
countries
## R date object cant be converted into csv files wither drop it or 
##use character version of date 01-01-2010
## convert month and year as date object
## google data studio supports format YYYYMMDD
filterData$Date <- paste("1-",filterData$mp_month,"-",filterData$mp_year,sep = "")

## Dropping year and month columns
finalData <- select (filterData,-all_of(c("mp_year","mp_month")))

## Date is r object while newdate is posixct
##wheatData$DateNew <- lapply(wheatData$Date1,as.POSIXct,format=("%Y-%m-%d"))


## filter data like crop type, country and market - wheat - india- Panji