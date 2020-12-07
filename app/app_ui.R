library(shiny)
library(ggplot2)
library(dplyr)
## Work on respective portions here

## Christian, Milli
intro_panel <- tabPanel(
  
)

## Patrick
interactive_panel_1 <- tabPanel(
  
)

## Evan
interactive_panel_2 <- tabPanel(
  titlePanel(),
  sidebarPanel(
    sliderInput("acq_date",
              "Dates:",
              min = as.Date("2019-12-29","%Y-%m-%d"),
              max = as.Date("2020-01-05","%Y-%m-%d"),
              value=as.Date("2020-01-05"),
              timeFormat="%Y-%m-%d")
  )
  
)


## Milli
interactive_panel_3 <- tabPanel(
  
)

## Final UI
ui <- navbarPage(
  # A page header with a descriptive title
  titlePanel("Australia"),
  
  h1("Australia Wildfire Exloration"),

  intro_panel, 

  interactive_panel_1,

  interactive_panel_2,

  interactive_panel_3, 
  
  conclusion_panel
)