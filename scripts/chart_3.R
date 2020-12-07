# Patrick + everyone!!
  
library(dplyr)
library(ggplot2)
rainfall <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/rainfall.csv')
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
  geom_line(data = canberra_avg_rain_by_years, aes(x = year, y = mean_rain), color = "red") +
  xlab('years') +
  ylab('rainfall')

rain_chart_final <- ggplot(all_avg_rain_by_years %>% group_by(city_name)) +
  #geom_point(mapping = aes(x = year, y = mean_rain, color = city_name)) +
  labs(x = "Year", y = "Mean rainfall", title = " Mean rainfall") +
  geom_line(mapping = aes(x = year, y = mean_rain, color = city_name), size=.5, alpha=0.9, linetype=2) + 
  ggtitle("Average Rainfall over the Years 1850-2020") + 
  xlab("Year") + ylab("Rainfall (Millimeters)") + coord_flip()

rainfall_year_chart <- ggplot(rainfall, aes(x = year, y = rainfall)) + 
  geom_line( color="#69b3a2", size=.5, alpha=0.9, linetype=2) + 
  ggtitle("Average Rainfall over the Years 1850-2020") + 
  xlab("Year") + ylab("Rainfall (Millimeters)")


