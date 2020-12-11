library(shiny)
library(ggplot2)
library(dplyr)
## Work on respective portions here

##Milli
intro_panel<-tabPanel(
  "Introduction",
  titlePanel("Introduction"),
  mainPanel(
      img(src='modis_scan.jpg', align = "right"),
    p("Climate change remains one of the greatest challenges of the 21st century. Australia, 
      an already deeply arid and dry country with a lot of land dedicated to agricultural pursuits, is especially at risk
      for the adverse impacts of climate change. 2018 was a year marked by the longest period of drought Australia has ever seen and the beginning of 2020 saw 
      months on-end of devastating bushfires all over Australia, which displaced and killed people and decimated flora and fauna. 
      The rising temperatures and changes in mean rainfall over time are the results of climate change, as are fires with more intense light and brightness which indicates
      that the fires are growing hotter. When we started this project, our group decided to look at various
      measures of climate change in Australia, both in 2020 and over the last 70 years, to examine how important measures of climate change (brightness, mean temperature, mean rainfall)
      are changing in major cities across Australia. We believe that examining these measures and calling attention to the potential devastation climate change could cause is necessary
      to shape coherent policy and invest in harm reduction strategies. For this project, we used two major datasets. Our first datase that compiled multiple sources 
      ranging from NASA to the Australian Government. We downloaded the dataset from the tidy Tuesday dataset sourced from NASA and the New South Wales Rural Fire Service courtesy of Dean Marchiori.Our second dataset 
      was constructed using values from the Australian Government's Bureau of Meteorology, which has historic data on rainfall and temperature change over time all over Australia.
      Both datasets helped us shape a project we believe is both meaningful and necessary in addressing and combating climate change in Australia.")))



## Evan
interactive_panel_1 <- tabPanel(
  titlePanel("Fire Brightness/Intensity"),
  h2("Taken from NASA's MODIS Satellite"),
  
  sidebarPanel(
    titlePanel("Specify your brightness map data"),
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
  ),
  h4("Map Findings"),
  p("By looking at the dates over time we were able to analyze how the fire spread and jumped 
      from city to city and through many of the vast grasslands and open spaces Australia has. There was also a 
      constant pressure on the Northern and South Eastern Portions of Australia with a Wildfire persisting through every day of the explored time period."),
  h4("About the MODIS Satellite"),
  p("The MODIS or (Moderate Resolution Imaging Spectroradiometer) features a low spatial resolution but high temporal resolution, MODIS data are useful to track changes in the landscape over time. 
    Examples of such applications are the monitoring of vegetation health by means of time-series analyses with vegetation indices, long term land
    cover changes (e.g. to monitor deforestation rates), global snow cover trends, water inundation from pluvial, riverine, or sea 
    level rise flooding in coastal areas, change of water levels of major lakes such as the Aral Sea, and the detection and mapping of wildland fires in the United States and around the world bringing our application of Australia. 
    Centre's like the 'The United States Forest Service's Remote Sensing Applications Center' analyzes MODIS imagery on a continuous basis to provide information for the management and suppression of wildfires"),
  img(src = "modis_scan.jpg")
)


## Milli
y_input<- selectInput(
  "y_var",
  label= "Choose a Y-Variable to Explore Over Time",
  choices= select_values,
  selected= "displ")  


interactive_panel_2 <- tabPanel(
  titlePanel("Temperature and Rainfall Changes in Australia  over Time"),
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

conclusion_panel<-tabPanel(
  "Conclusion",
  titlePanel("Conclusion"),
  mainPanel(
    p("")))

## Final UI
ui <- navbarPage(
  # A page header with a descriptive title
  titlePanel("Australia"),
  
  h1("Australia Wildfire Exploration"),

  intro_panel, 

  interactive_panel_1,

  interactive_panel_2,
   
  conclusion_panel)