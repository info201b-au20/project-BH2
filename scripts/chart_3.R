# Patrick + everyone!!
  
library(tidyverse)
library(ggplot2)

# City of Perth rainfall
perth_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "PERTH") %>% 
  filter(rainfall == "max") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainerature, na.rm = T))

# City of Port rainfall

port_avg_rain_by_years<- rainfall %>% 
  mutate(rainfall, year = format(date, "%Y")) %>% 
  filter(city_name == "PORT") %>% 
  filter(rain_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainerature, na.rm = T))

# City of Kent rainfall

kent_avg_rain_by_years<- rainfall %>% 
  mutate(rainfall, year = format(date, "%Y")) %>% 
  filter(city_name == "KENT") %>% 
  filter(rain_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainerature, na.rm = T))

# City of Brisbane rainerature

brisbane_avg_rain_by_years<- rainfall %>% 
  mutate(rainfall, year = format(date, "%Y")) %>% 
  filter(city_name == "BRISBANE") %>% 
  filter(rain_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainerature, na.rm = T))

# City of Sydney rainerature

sydney_avg_rain_by_years<- rainfall %>% 
  mutate(rainfall, year = format(date, "%Y")) %>% 
  filter(city_name == "SYDNEY") %>% 
  filter(rain_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainerature, na.rm = T))

# City of Canberra rainerature

canberra_avg_rain_by_years<- rainfall %>% 
  mutate(rainfall, year = format(date, "%Y")) %>% 
  filter(city_name == "CANBERRA") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainerature, na.rm = T))

# City of Melbourne rainerature

melbourne_avg_rain_by_years <- rainfall %>% 
  mutate(rainfall, year = format(date, "%Y")) %>% 
  filter(city_name == "MELBOURNE") %>% 
  filter(rain_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainerature, na.rm = T))

# all rainerature averages

all_avg_rain_by_years <- rainfall %>% 
  mutate(rainfall, year = format(date, "%Y")) %>%
  group_by(city_name, year) %>% 
  filter(rain_type == "max") %>% 
  summarise(mean_rain = mean(rainerature, na.rm = T))

rainfall_year_chart <- ggplot(rainfall, aes(x = year, y = rainfall)) + geom_point(size=2, shape=23)
ggsave()
