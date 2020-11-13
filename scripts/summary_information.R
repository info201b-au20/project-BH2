# Milli

download.packages(tidyr)
library(tidyr)
library(readr)
library(dplyr)

australia_fires<- read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-07/temperature.csv")

# A function that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$num_observations <- nrow(australia_fires)
summary_info$maxtemperaturedate <- australia_fires %>%
filter(temperature == max(temperature, na.rm = T)) %>%
  select(date)
summary_info$maxtemperature<-australia_fires %>%
  filter(temperature == max(temperature,na.rm=T))
summary_info$mean<-australia_fires %>%
  filter(temperature == mean(temperature, na.rm= T))%>%
summary_info$median<-australia_fires %>% 
  filter(temperature == median(temperature, na.rm= T)) %>%


  