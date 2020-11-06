library(tidyverse)

temperature <- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/temperature.csv")

temp_rows <- nrow(temperature)
temp_col <- ncol(temperature)
