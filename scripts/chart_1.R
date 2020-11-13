library(tidyverse)
library(dplyr)
library(ggplot2)
temperatures <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/temperature.csv")

temp_rows <- nrow(temperatures)
temp_col <- ncol(temperatures)

num_diff_places <- unique(temperatures$city_name)

# How has temperature patterns altered over the course of decades?

# City of Perth temperatures
perth_avg_temp_by_years<- temperatures %>% 
  mutate(temperatures, year = format(date, "%Y")) %>% 
  filter(city_name == "PERTH") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Port temperatures

port_avg_temp_by_years<- temperatures %>% 
  mutate(temperatures, year = format(date, "%Y")) %>% 
  filter(city_name == "PORT") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Kent temperatures

kent_avg_temp_by_years<- temperatures %>% 
  mutate(temperatures, year = format(date, "%Y")) %>% 
  filter(city_name == "KENT") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Brisbane temperature

brisbane_avg_temp_by_years<- temperatures %>% 
  mutate(temperatures, year = format(date, "%Y")) %>% 
  filter(city_name == "BRISBANE") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Sydney temperature

sydney_avg_temp_by_years<- temperatures %>% 
  mutate(temperatures, year = format(date, "%Y")) %>% 
  filter(city_name == "SYDNEY") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Canberra temperature

canberra_avg_temp_by_years<- temperatures %>% 
  mutate(temperatures, year = format(date, "%Y")) %>% 
  filter(city_name == "CANBERRA") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Melbourne temperature

melbourne_avg_temp_by_years<- temperatures %>% 
  mutate(temperatures, year = format(date, "%Y")) %>% 
  filter(city_name == "MELBOURNE") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# What does distribution of temperatures tell us about global warming?


# Are there any amount of fire occurences that correlate with 
# rising temperatures?

# How has the min temperature and max temperature differed throughout the years?

# Are there certain locations that are impacted more than others? In other
# words, were there any drastic changes in the distribiution of temperatures
# over the course of the recorded dates?

# plot for temperatures across cities within time frame

