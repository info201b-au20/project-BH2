Christian

library(tidyverse)
library(dplyr)
library(readr)
# link for data

nasa_fire <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/MODIS_C6_Australia_and_New_Zealand_7d.csv')
us_fires <- read_csv('https://raw.githubusercontent.com/BuzzFeedNews/2018-07-wildfire-trends/master/data/us_fires/us_fires_1.csv')


fire_rows <- nrow(nasa_fire)
fire_col <- ncol(nasa_fire)

fire_temp <- nasa_fire$brightness
date <- unique(nasa_fire$acq_date)

avg_temp_29 <- nasa_fire %>% 
  group_by(acq_date) %>% 
  
  


# fire temp max and low in Celcuis

brightest_fire <- max(nasa_fire$brightness- 273 )
dim_fire <- min(nasa_fire$brightness - 273)


perth_location <- nasa_fire%>% 
  mutate(cords = "" 
         
         