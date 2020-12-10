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
  titlePanel("Fire Brightness/Intensity"),
  sidebarPanel(
    sliderInput(inputId = "acq_date",
                label = "Peak Dates: June 2019 - May 2020",
                min = as.Date("2019-06-01","%Y-%m-%d"),
                max = as.Date("2020-05-31","%Y-%m-%d"),
                value=as.Date("2020-05-31"),
                timeFormat="%Y-%m-%d"),
    checkboxGroupInput(inputId = "daynight", 
                       label = "Check day (D)/night (N) or both",
                       choices = list("D", "N"), 
                       selected = list("D", "N"))
  ),
  mainPanel(
    leafletOutput(outputId = "brightness_map")
  )
)


## Milli
y_input<- selectInput(
  "y_var",
  label= "Choose a Y-Variable to Explore Over Time",
  choices= select_values,
  selected= "displ")  


interactive_panel_3 <- tabPanel(
  titlePanel("Interactive Plot #3"),
  mainPanel(
  h3(plotOutput("scatter"),
     sidebarLayout(
       sidebarPanel( 
         y_input<- selectInput(
           "y_var",
           label= "Choose a Y-Variable to Explore Over Time",
           choices= select_values,
           selected= "displ")  ),
       )
  )))


## Final UI
ui <- navbarPage(
  # A page header with a descriptive title
  titlePanel("Australia"),
  
  h1("Australia Wildfire Exloration"),

  intro_panel, 

  interactive_panel_1,

  interactive_panel_2,

  interactive_panel_3, 
  
  conclusion_panel)