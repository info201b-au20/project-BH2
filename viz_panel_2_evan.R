# Map brightness data
library(sf)
library(mapview)
library(ggmap)
library(dplyr)
library(ggplot2)

## Working map
nasa_modis_brightness <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/MODIS_C6_Australia_and_New_Zealand_7d.csv")

prep_nasa_modis_brightness <- as_tibble(nasa_modis_brightness %>% 
  select(latitude, longitude, brightness, input$acq_date))

locations_sf <- st_as_sf(prep_nasa_modis_brightness, 
                         coords = c("longitude", "latitude"), crs = 4121)

map <- get_stamenmap (center = c(133.7751, 25.2744))

mapview(locations_sf, cex = "brightness", zoom = 1)


## Get inputs into map
ggmap()




