library(tidyverse)
library(dplyr)
library(ggplot2)
temperature <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/temperature.csv")

temp_rows <- nrow(temperature)
temp_col <- ncol(temperature)

num_diff_places <- unique(temperature$city_name)

# How has temperature patterns altered over the course of decades?

# City of Perth temperature
perth_avg_temp_by_years<- temperature %>% 
  mutate(temperature, year = format(date, "%Y")) %>% 
  filter(city_name == "PERTH") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Port temperature

port_avg_temp_by_years<- temperature %>% 
  mutate(temperature, year = format(date, "%Y")) %>% 
  filter(city_name == "PORT") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Kent temperature

kent_avg_temp_by_years<- temperature %>% 
  mutate(temperature, year = format(date, "%Y")) %>% 
  filter(city_name == "KENT") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Brisbane temperature

brisbane_avg_temp_by_years<- temperature %>% 
  mutate(temperature, year = format(date, "%Y")) %>% 
  filter(city_name == "BRISBANE") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Sydney temperature

sydney_avg_temp_by_years<- temperature %>% 
  mutate(temperature, year = format(date, "%Y")) %>% 
  filter(city_name == "SYDNEY") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Canberra temperature

canberra_avg_temp_by_years<- temperature %>% 
  mutate(temperature, year = format(date, "%Y")) %>% 
  filter(city_name == "CANBERRA") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# City of Melbourne temperature

melbourne_avg_temp_by_years <- temperature %>% 
  mutate(temperature, year = format(date, "%Y")) %>% 
  filter(city_name == "MELBOURNE") %>% 
  filter(temp_type == "max") %>% 
  group_by(year) %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))

# all temperature averages

all_avg_temp_by_years <- temperature %>% 
  mutate(temperature, year = format(date, "%Y")) %>%
  group_by(city_name, year) %>% 
  filter(temp_type == "max") %>% 
  summarise(mean_temp = mean(temperature, na.rm = T))


# plot temperature and fire count


temp_chart_final <- ggplot(all_avg_temp_by_years %>% group_by(city_name)) +
  geom_point(mapping = aes(x = year, y = mean_temp, color = city_name)) +
  labs(x = "Year", y = "Mean temperature", title = " Mean temperature")  
  
  #scale_x_continuous(breaks = seq(1910, 2020, by = 20))
  
 #print(temp_chart_final)

  breaks = seq(19)
  geom_line(mapping = aes(x = year, y = mean_temp, color = city_name)) +
  labs(x = "year", y = "mean temperature", title = " Mean temperature")




# find difference between min date max temp and max date max temp

max_temps_current <- temperature %>% 
  mutate(temperature, year = format(date, "%Y")) %>% 
  filter(temp_type == "max") %>%
  filter(year == max(year)) %>% 
  group_by(city_name) %>% 
  summarise(diff_in_temp = max(temperature, na.rm = T))
max_temps_start <- temperature %>% 
  mutate(temperature, year = format(date, "%Y")) %>% 
  filter(temp_type == "max") %>% 
  filter(year == "1949") %>% 
  group_by(city_name) %>% 
  summarise(diff_in_temp = max(temperature, na.rm = T))

temp_diff <- max_temps_current$diff_in_temp - max_temps_start$diff_in_temp

print_temp_diff <- function(temp_diff){
  sum_val <- 0
  for (val in temp_diff) {
    sum_val = sum_val + val
  }
  if (sum_val > 0) {
    sentence <- paste("The temperature has risen a total of", sum_val, "degrees")
  } else {
    sentence <- paste("The temperature has decreased a total of", sum_val, " degrees")
  }
}


# The prompts below should probably be answered in another script as this 
# script is only for displaying charts

# Are there any amount of fire occurrences that correlate with 
# rising temperature?

# How has the min temperature and max temperature differed throughout the years?

# Are there certain locations that are impacted more than others? In other
# words, were there any drastic changes in the distribution of temperature
# over the course of the recorded dates?

# plot for temperature across cities within time frame

