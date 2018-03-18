# Create St. Louis City Boundary

# dependencies
library(here)
library(dplyr)
library(sf)
library(tigris)

# pull Missouri counties from Census Tiger database
moCounties <- counties(state = 29)

# convert to sf object
moCounties <- st_as_sf(moCounties)

# filter city of st louis
moCounties %>% 
  filter(COUNTYFP == "510") %>%
  select(STATEFP, COUNTYFP, NAMELSAD, ALAND) -> stl

# write shapefile
st_write(stl, here("data", "STL_BOUNDARY_City", "STL_BOUNDARY_City.shp"))