# Map brightness data
library(sf)
library(mapview)
library(ggmap)
library(dplyr)
library(ggplot2)

## Working map
nasa_modis_brightness <- readr::read_csv("fire_archive_M6_169855.csv")

prep_nasa_modis_brightness <- as_tibble(nasa_modis_brightness %>% 
  select(latitude, longitude, brightness, input$acq_date))

locations_sf <- st_as_sf(prep_nasa_modis_brightness, 
                         coords = c("longitude", "latitude"), crs = 4121)

mapview(locations_sf, cex = "brightness", zoom = 1)


## Get inputs into map
ggmap(map)




