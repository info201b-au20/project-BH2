# Patrick + everyone!!
  
library(tidyverse)
library(ggplot2)

uniq_cities <- unique(rainfall$city_name, incomparables = FALSE)
#Perth
#Adelaide
#Brisbane
#Sydney
#Canberra
#Melbourne

# City of Perth rainfall
perth_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Perth") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# City of Adelaide rainfall

adelaide_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Adelaide") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# City of Brisbane rainfall

brisbane_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Brisbane") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# City of Sydney rainfall

sydney_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Sydney") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# City of Canberra rainfall

canberra_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Canberra") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# City of Melbourne rainfall

melbourne_avg_rain_by_years<- rainfall %>% 
  filter(city_name == "Melbourne") %>% 
  group_by(year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

# all rainfall averages

all_avg_rain_by_years <- rainfall %>%
  group_by(city_name, year) %>% 
  summarise(mean_rain = mean(rainfall, na.rm = T))

p2 = ggplot() + 
  geom_line(data = brisbane_avg_rain_by_years, aes(x = year, y = mean_rain), color = "blue") +
  geom_line(data = Canberra_avg_rain_by_years, aes(x = year, y = mean_rain), color = "red") +
  xlab('years') +
  ylab('rainfall')

rain_chart_final <- ggplot(all_avg_rain_by_years %>% group_by(city_name)) +
  geom_point(mapping = aes(x = year, y = mean_rain, color = city_name)) +
  labs(x = "Year", y = "Mean rainfall", title = " Mean rainfall") 

rainfall_year_chart <- ggplot(rainfall, aes(x = year, y = rainfall)) + geom_point(size=2, shape=23)
ggsave()
