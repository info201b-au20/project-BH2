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
  
)

## Milli
interactive_panel_3 <- tabPanel(
  
)

## Final UI
ui <- navbarPage(
  # A page header with a descriptive title
  h1("Australia Wildfire Exloration"),

  intro_panel, 

  interactive_panel_1,

  interactive_panel_2,

  interactive_panel_3, 
  
  conclusion_panel
)