#Evan
library(tidyverse)
# Get the Data

rainfall <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/rainfall.csv')
temperature <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/temperature.csv')
# IF YOU USE THIS DATA PLEASE BE CAUTIOUS WITH INTERPRETATION
nasa_fire <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/MODIS_C6_Australia_and_New_Zealand_7d.csv')
# For JSON File of fires
url <- "http://www.rfs.nsw.gov.au/feeds/majorIncidents.json"
aus_fires <- sf::st_read(url)
# Or read in with tidytuesdayR package (https://github.com/thebioengineer/tidytuesdayR)
# Either ISO-8601 date or year/week works!
# Install via devtools::install_github("thebioengineer/tidytuesdayR")
tuesdata <- tidytuesdayR::tt_load('2020-01-07') 
tuesdata <- tidytuesdayR::tt_load(2020, week = 2)
rainfall <- tuesdata$rainfall

fire_dates <- nasa_fire %>% 
  rename(
    date = acq_date
  )

# combine the year, month, date columns into one 
# convert lat and long to AUS regions for nasa_fire
# convert the city_name into regions for temperature
# convert the city_name into regions for rainfall
# group_by region


temp_rain_region <- left_join(rainfall, temperature, by = "city_name")

fire_temp_table <- left_join(fire_dates, temperature, by = "date")

fire_temp_rain_table <- left_join(fire_temp_table, temperature, by = "date")

fire_temp_table <- group_by(date) %>% 
  summarize( 
    mean_brightness
    )












