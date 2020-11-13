library(tidyverse)
library(dplyr)
library(ggplot2)
temperature <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/temperature.csv")

temp_rows <- nrow(temperature)
temp_col <- ncol(temperature)

num_diff_places <- unique(temperature$city_name)

# How has temperature patterns altered over the course of decades?
perth_by_years<- temperature %>% 
  mutate(temperature, year = format(date, "%Y"))

# What does distribution of temperatures tell us about global warming?

# Are there any amount of fire occurences that correlate with 
# rising temperatures?

# How has the min temperature and max temperature differed throughout the years?

# Are there certain locations that are impacted more than others? In other
# words, were there any drastic changes in the distribiution of temperatures
# over the course of the recorded dates?