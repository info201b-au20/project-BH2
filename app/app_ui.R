library(shiny)
library(ggplot2)
library(dplyr)
library(markdown)
library(shinythemes)
## Work on respective portions here

##Milli
intro_panel<-tabPanel(
  h4("Introduction", style = "color: #591a0c"),
  sidebarLayout(
    sidebarPanel(
      h3("Variable Introduction", style = "color: #a84632;"),
      # includeMarkdown("variable.md"),
      img(src='blacksaturday.jpg', height = "60%", width = "60%")
    ),
    mainPanel(
        h1("How the Changing Climate Has Impacted Wildfires in Australia", style = "color: #a84632;"),
        img(src='modis_scan.jpg', height = "60%", width = "60%"),
        h4(includeMarkdown("intro.md"))
      )
    )
)



## Evan
interactive_panel_1 <- tabPanel(
  # titlePanel("Fire Brightness/Intensity"),
  h4("Fire Brightness/Intensity", style = "color: #591a0c"),
  h2("Taken from NASA's MODIS Satellite", style = "color: #a84632;"),
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
  h4("Map Findings", style = "color: #a84632;"),
  p("By looking at the dates over time we were able to analyze how the fire spread and jumped 
      from city to city and through many of the vast grasslands and open spaces Australia has. There was also a 
      constant pressure on the Northern and South Eastern Portions of Australia with a Wildfire persisting through every day of the explored time period."),
  h4("About the MODIS Satellite", style = "color: #a84632;"),
  p("The MODIS or (Moderate Resolution Imaging Spectroradiometer) features a low spatial resolution but high temporal resolution, MODIS data are useful to track changes in the landscape over time. 
    Examples of such applications are the monitoring of vegetation health by means of time-series analyses with vegetation indices, long term land
    cover changes (e.g. to monitor deforestation rates), global snow cover trends, water inundation from pluvial, riverine, or sea 
    level rise flooding in coastal areas, change of water levels of major lakes such as the Aral Sea, and the detection and mapping of wildland fires in the United States and around the world bringing our application of Australia. 
    Centre's like the 'The United States Forest Service's Remote Sensing Applications Center' analyzes MODIS imagery on a continuous basis to provide information for the management and suppression of wildfires"),
  img(src='modis_scan.jpg', height = "60%", width = "60%"),
  h4("Full plotting of data from June 2019 - May 2020.", style = "color: #a84632;"),
  p("Here we see all the data from the peak months of the fire plotted. The Northern and the South Eastern portions of Australia were effected the most. We can see that many of the large cities such as Dysney, Melbourne, Brisbane and Perth were impacted."),
  img(src='brightness_map.png', height = "60%", width = "60%")
)


# Milli
y_input <- selectInput(
  inputId = "y_var",
  label = "Choices", 
  choices = list(
    "Sydney Rainfall (mm)" = "Sydney_Rainfall_mm",
    "Perth Rainfall (mm)" = "Perth_Rainfall_mm",
    "Darwin Rainfall (mm)" = "Darwin_Rainfall_mm",
    "Sydney Temperature (Celsius)" = "Sydney_Temperature_mm",
    "Perth Temperature (Celsius)" = "Perth_Temperature_mm",
    "Darwin Temperature (Celsius)" = "Darwin_Temperature_mm"
  )
)

interactive_panel_2 <- tabPanel(
  h4("Interactive Charts", style = "color: #591a0c"),
  sidebarLayout(
    sidebarPanel(
      h1("Input section"),
      y_input,
    ),
    mainPanel(
      h2("Temperature and Rainfall Changes in Australia  over Time", style = "color: #a84632;"),
      plotlyOutput("rain_temp_plot")
    )
  )
)
  

conclusion_panel<-tabPanel(
  h4("Conclusion", style = "color: #591a0c"),
  mainPanel(
    h2("Concluding Thoughts", style = "color: #a84632;"),
    p("We designed this project to be an exporation of both the magnitude and severity 
    of the wildfires in Australia and the various measures of climate change that have impacted
      those wildfires. We researched our domain thoroughly and found that climate change increases 
      the mean temperature over time, resulting in dry land that burns easily and that heat waves happen more frequently
      and for longer. We also learned that a decrease in rain can reuslt in droughts, also a 
      driver of wildfires. We hypothesized that the increase in wildfires and wildfire intensity (measured in brightness) was 
      the result of these factors, which are in turn the result of the climate changing.
      After creating our graphs, we reached three major conclusions, which support our hypothesis and hopefully relay the severity of 
      the issue and compel both people and governmental entities to take decisive policy action."), 
    h4("Point One", style = "color: #a84632;"),
    p("Our 'fire brightness/intensity' map exhibits how the range of where wildfires have been historically has changed and is growing. 
      It shows how the fires have moved into big cities where they were previously isolated in the grasslands and how there are 
      new clusters of fires in the middle of Australia where there previously were none. This takeaway is especially significant because
      it shows the increasing magnitude and range of bushfires and has negative implications for the many people who have been and will be displaced
      due to the fire's change in location and intensity."),
    #img(src='fireevolution.jpg', height = "60%", width = "60%"),
    HTML('<center><img src="fireevolution.jpg"></center>'),
    h4("Point Two", style = "color: #a84632;"),
    p("Average yearly rainfall over time is decreasing across all three cities that we measured in Australia.
      In 1950, the yearly rainfall in Sydney averaged out at 1750.8mm---in 2019, it was a mere 984.1mm, indicating a decrease of 766.7 mm 
      over the last 70 years. Although rainfall average does change year to year, our graph indicates that it has been decreasingly steadily
      in all three sites of interest (which were chosen due to their vastly different geospatial locations). The decrease in rainfall is concerning 
      because with less rain, the land grows more arid and dry, making the bush more susceptible to catching fire and increasing the likelihood of 
      drought and bushfire."),
    #img(src='rainfall.jpg', height = "60%", width = "60%"),
    HTML('<center><img src="rainfall.jpg"></center>'),
    h4("Point Three", style = "color: #a84632;"),
    p("Average temperature over time is increasing (and appears to be inversely correlated with mean rainfall although further study is needed)
       In Darwin, in 1950, the mean temperature observed was 31.3 degrees Celcius. By 2019, it had risen to 33.Perth followed a similar trend, with a mean yearly temperature of 23.4 degrees Celcius 
       in 1955 and a yearly mean temperature of 26.1 degrees celcius in 2019. Although a difference of 2 degrees may seem insignficant, the trend of rising temperatures
       is deeply concerning as they result in drought and heat waves, which contribute to the prevalence of bushfires. 
       Additionally, the temperature is projected to rise another two degrees globally by 2090, which would set off a chain of adverse events
       such as flooding, extreme drought, water scarcity and rise in zoonotic disease. "),
    #img(src='temp.png', height = "60%", width = "60%"),
    HTML('<center><img src="temp.png"></center>'),
    h4("Final Thought", style = "color: #a84632;"),
    p("In conclusion, climate change has very real negative impacts for everyone and everything---whether it be flora, fauna, humans or the environment at large.
      Our project used Australia as a case study to show how the impacts of climate change have increased 
      the range and magnitude of forest fires and contributed to conditions that negatively exacerbate the likelihood of future fires, such as drought and heat waves brought on by rising 
      temperature and decreasing rainfall.")
    )
  )

## Final UI
ui <- navbarPage(theme = shinytheme("journal"),
  # A page header with a descriptive title
  "Australia Wildfire Exploration",

  intro_panel, 

  interactive_panel_1,

  interactive_panel_2,
   
  conclusion_panel
)

