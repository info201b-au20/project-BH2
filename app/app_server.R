# Load libraries so they are available
# Read data file
bom_data <- read.csv("bom_values_numbers.csv")
fire_data <- read.csv("fire_archive_M6_169855.csv")
nasa_modis_brightness <- read_csv("fire_archive_M6_169855.csv")

# Variable Analysis

# City Rain Charts
syd_rain_chart <- bom_data %>% 
  filter(City == "Sydney") %>% 
  select(Year, Rainfall_mm)
names(syd_rain_chart)[names(syd_rain_chart) 
                      == "Rainfall_mm"] <- "Sydney_Rainfall_mm"

perth_rain_chart <- bom_data %>% 
  filter(City == "Perth") %>% 
  select(Year, Rainfall_mm)
names(perth_rain_chart)[names(perth_rain_chart) 
                        == "Rainfall_mm"] <- "Perth_Rainfall_mm"

dar_rain_chart <- bom_data %>% 
  filter(City == "Darwin") %>% 
  select(Year, Rainfall_mm)
names(dar_rain_chart)[names(dar_rain_chart) 
                      == "Rainfall_mm"] <- "Darwin_Rainfall_mm"

# City Temperature Charts
syd_temp_chart <- bom_data %>% 
  filter(City == "Sydney") %>% 
  select(Year, Temperature_C)
names(syd_temp_chart)[names(syd_temp_chart) 
                      == "Temperature_C"] <- "Sydney_Temperature_C"

perth_temp_chart <- bom_data %>% 
  filter(City == "Perth") %>% 
  select(Year, Temperature_C)
names(perth_temp_chart)[names(perth_temp_chart) 
                        == "Temperature_C"] <- "Perth_Temperature_C"

dar_temp_chart <- bom_data %>% 
  filter(City == "Darwin") %>% 
  select(Year, Temperature_C)
names(dar_temp_chart)[names(dar_temp_chart) 
                      == "Temperature_C"] <- "Darwin_Temperature_C"

# Combine Data Frames
rain_temp_city_data <- merge(perth_rain_chart, 
                             merge(perth_temp_chart,
                                   merge(dar_rain_chart, 
                                         merge(dar_temp_chart, 
                                               merge(syd_rain_chart, syd_temp_chart)))))

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
output$temp_plot <- renderPlotly({
  
  title <- paste0("Temperature Changes Over the Years")
  plot1 <- ggplot(data = rain_temp_city_data) +
    geom_line(mapping = aes_string(x = "Year", y = input$y_var_temp)) +
    ggtitle("Measures of Climate Change in Australia
            Over Time") +
    labs(y = "Measure of Climate Change", x = "Years") +
    theme_economist()
  ggplotly(plot1) 
  
  })

output$rain_plot <- renderPlotly({
  title <- paste0("Rainfall Changes Over the Years")
  plot2 <- ggplot(data = rain_temp_city_data) +
    geom_line(mapping = aes_string(x = "Year", y = input$y_var_rain)) +
    ggtitle("Measures of Climate Change in Australia
            Over Time") +
    labs(y = "Measure of Climate Change", x = "Years") +
    theme_economist()
  ggplotly(plot2) 
})

}

