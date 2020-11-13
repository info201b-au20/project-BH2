library(tidyverse)
library(dplyr)

temperature <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/temperature.csv")

temp_rows <- nrow(temperature)
temp_col <- ncol(temperature)

num_diff_places <- unique(temperature$city_name) %>% 
  View()


