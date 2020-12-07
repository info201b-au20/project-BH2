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
}
  
# Interactive panel 2

  output$leaflet <- renderPlot({

  output$plot <- renderPlot({
   
    # return the plot
    

  })
  })
# Interactive panel 3
  server<-function(input,output){
output$scatter <- renderPlot({
  plot_data<-bom_values%>%
    filter(City=="Sydney"|City=="Darwin"|City=="Perth")%>%
  plot<-ggplot(data = bom_values)+
    geom_line(mapping=aes_string(x="year",y=input$y_var,color="City"))+
    ggtitle("Measures of Climate Change in Australia
            Over Time")+
    labs(y="Measure of Climate Change",x="Years")
  ggplot(plot)
  })
  }
  print(plot)