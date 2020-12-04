# Load libraries so they are available
library("shiny")
library("ggplot2")

# Read data file
income_growth <- read.csv("data/income_growth_1980-2014.csv")

# Define a server function
server <- function(input, output) {
  
# Interactive panel 1
  output$plot <- renderPlot({
    # return the plot
    
  })
  
# Interactive panel 2
  output$plot <- renderPlot({
    # return the plot
    
  })
  
# Interactive panel 3
  output$plot <- renderPlot({
    # return the plot
    
  })
}