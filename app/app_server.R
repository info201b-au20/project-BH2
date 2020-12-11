# Load libraries so they are available
library("shiny")
library("ggplot2")
library(leaflet)
library(plotly)

# Read data file
bom_data <- read.csv("bom_values_numbers.csv")
fire_data <- read.csv("fire_archive_M6_169855.csv")

# Define a server function
server <- function(input, output) {


  
# Interactive panel 1
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
  
# Goals
# different graph for different cities
# comparison plot, change opacity for selected element OR
# Date Range
# Select Rainfall or Temperature Plot

# Interactive panel 2
output$scatter <- renderPlotly({
  title <- paste0("Title")
  rain_data <- bom_data %>%
    group_by(City) %>% 
    select(City, Rainfall_mm)
  temp_data <- bom_data %>% 
    group_by(City) %>% 
    select(City, Temperature_C)
  plot1 <- ggplot(data = bom_data) +
    geom_line(mapping = aes_string(x = "Year", y = "Rainfall_mm" ,color="City")) +
    ggtitle("Measures of Climate Change in Australia
            Over Time") +
    labs(y = "Measure of Climate Change", x = "Years")
  ggplotly(plot1) 
  })

}

