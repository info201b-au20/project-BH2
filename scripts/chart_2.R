
library(tidyverse)
library(dplyr)
library(readr)
# link for data

nasa_fire <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/MODIS_C6_Australia_and_New_Zealand_7d.csv')
fire_rows <- nrow(nasa_fire)
fire_col <- ncol(nasa_fire)

# there are 8 different days in this data 
date <- unique(nasa_fire$acq_date)

# fire temp max and low in Celcuis
hottest_fire <- max(nasa_fire$brightness- 273 )
coldest_fire <- min(nasa_fire$brightness - 273)

#average fire temp of the day
avg_tem_day <- nasa_fire %>% 
  group_by(acq_date) %>% 
  mutate(fire_temp = brightness) %>% 
  summarise(avgtmp = mean(fire_temp))

#lowest temp for the day
lowest_tem_day <- nasa_fire %>% 
  group_by(acq_date) %>% 
  filter(brightness == min(brightness)) 

#highest temp for the day
highest_tem_day <- nasa_fire %>% 
  group_by(acq_date) %>% 
  filter(brightness == max(brightness))

#all three tables in one
new_data1 <- merge(lowest_tem_day, highest_tem_day)
new_data2 <- merge(




