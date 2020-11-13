# Patrick + everyone!!
  
library(tidyverse)
library(ggplot2)

uniq_cities <- unique(rainfall$city_name, incomparables = FALSE)
Perth
2
Adelaide
3
Brisbane
4
Sydney
5
Canberra
6
Melbourne

# City of Perth rainfall
perth_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Perth") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# City of Adelaide rainfall

Adelaide_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Adelaide") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# City of Brisbane rainfall

brisbane_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Brisbane") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# City of Sydney rainfall

Sydney_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Sydney") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# City of Canberra rainfall

Canberra_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Canberra") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# City of Melbourne rainfall

Melbourne_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Melbourne") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# all rainfall averages

all_avg_rain_by_years <- rainfall %>% 
  mutate(rainfall, year = format(date, "%Y")) %>%
  group_by(city_name, year) %>% 
  filter(rain_type == "max") %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

rainfall_year_chart <- ggplot(rainfall, aes(x = year, y = rainfall)) + geom_point(size=2, shape=23)
ggsave()
