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
output$brightness_map <- renderLeaflet({
  
  prep_nasa_modis_brightness <- nasa_modis_brightness %>% 
    select(latitude, longitude, brightness, acq_date, daynight) %>% 
    filter(acq_date == input$acq_date) %>% 
    filter(daynight == input$daynight)
  
  palette_fn <- colorNumeric(
    palette = ("YlOrRd"),
    domain = prep_nasa_modis_brightness[["brightness"]],
    reverse = TRUE
  )
  
  leaflet(data = prep_nasa_modis_brightness) %>%
    addProviderTiles("Stamen.TonerLite") %>% 
    addCircleMarkers(
      lat = ~latitude,
      lng = ~longitude,
      label = ~paste0("The brightness is ", brightness, " fire pixels (Kelvin) on ", acq_date),
      color = ~palette_fn(prep_nasa_modis_brightness[["brightness"]]),
      fillOpacity = .7,
      radius = 3,
      stroke = FALSE#,
      #color = "red"
    ) %>% 
    setView(133.54, -25.62, zoom = 4) %>% 
    addLegend(pal = palette_fn, na.label = "NA", bins = 5, 
              values = ~brightness, title = "Brightnesss") 
})
  
  
# Interactive panel 3
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