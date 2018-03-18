# Create St. Louis Diabetes Data

# dependencies
library(cityHealth)
library(dplyr)
library(here)
library(readr)

# create st. louis data
all <- ch_tbl_tract17
all %>%
  filter(city_fips == "2965000") %>%
  filter(question == "Diabetes") %>%
  select(state, city, tract_fips, year, question, estimate) -> STL_HEALTH_Diabetes

# write csv file
write_csv(STL_HEALTH_Diabetes, here("data", "STL_HEALTH_Diabetes.csv"))
