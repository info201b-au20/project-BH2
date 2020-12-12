library(shiny)
library(markdown)
library(shinythemes)
library(leaflet)
## Work on respective portions here
bom_data <- read.csv("bom_values_numbers.csv")
fire_data <- read.csv("fire_archive_M6_169855.csv")
nasa_modis_brightness <- read_csv("fire_archive_M6_169855.csv")
##Milli
intro_panel<-tabPanel(
  h4("Introduction", style = "color: #591a0c"),
  sidebarLayout(
    sidebarPanel(
      h3("Variable Analysis", style = "color: #a84632;"),
      h4(includeMarkdown("variable.md")),
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
    titlePanel("Pick date to explore"),
    sliderInput(inputId = "acq_date",
                label = "Peak Dates: June 2019 - May 2020",
                min = as.Date("2019-06-01","%Y-%m-%d"),
                max = as.Date("2020-05-31","%Y-%m-%d"),
                value=as.Date("2020-05-31"),
                timeFormat="%Y-%m-%d"),
    checkboxGroupInput(inputId = "daynight", 
                       label = "Check day (D)/night (N) or both",
                       choices = list("D", "N"), 
                       selected = list("D", "N")),
    p("(Caveat: Red is dimmer, Yellow is Brighter. Majority of inputs were in the ~300 range necesitating red highlights.)")
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
variables_temp <- list(
  "Sydney Temperature (Celsius)" = "Sydney_Temperature_C",
  "Perth Temperature (Celsius)" = "Perth_Temperature_C",
  "Darwin Temperature (Celsius)" = "Darwin_Temperature_C"
)
variables_rain <- list(
  "Sydney Rainfall (mm)" = "Sydney_Rainfall_mm",
  "Perth Rainfall (mm)" = "Perth_Rainfall_mm",
  "Darwin Rainfall (mm)" = "Darwin_Rainfall_mm"
)

y_input_rain <- selectInput(
  inputId = "y_var_rain",
  label = "Data For Rainfall Changes",
  choices = variables_rain,
  HTML('<center><img src="rain_16x9.jpg"></center>')
)

y_input_temp <- selectInput(
  inputId = "y_var_temp",
  label = "Data For Temperature Changes",
  choices = variables_temp,
)


interactive_panel_2 <- tabPanel(
  h4("Rain and Temperature Change", style = "color: #591a0c"),
  sidebarLayout(
    sidebarPanel(
      h1("Choices"),
      y_input_temp,
      y_input_rain
    ),
    mainPanel(
      h1("Temperature and Rainfall Changes in Australia over Time"),
      tabsetPanel(
        tabPanel(
          h4("Temperature Changes in Australia Over Time", style = "color: #a84632;"),
          plotlyOutput("temp_plot"),
        ),
        tabPanel(
          h4("Rainfall Changes in Australia Over Time"),
          plotlyOutput("rain_plot")
        ),
        h4("Chart Findings", style = "color: #a84632;"),
        p("Here we can see how rainfall has changed over the years in Australia. A notable change is that the 
            mm's of rainfall have decreased in every city over the years. This is shown by interacting with the graphic. 
            A great example of this happening is in the City of Perth."),
        h4("What 'sparked' the fires?", style = "color: #a84632;"),
        p("Lightning, drought, and arson"),
        h4("Droughts role in a bad fire season", style = "color: #a84632;"),
        p("A likely contributor to the bushfire crisis was the ongoing drought in eastern Australia – the most severe 
            on record for some fire affected areas. Exacerbating the effects of diminished rainfall in this drought has 
            been a record breaking run of above average monthly temperatures, lasting 36 months to October 2019. The combination 
            of heat and drought caused critical low fuel moisture content, with Victoria Country Fire Authority Response Controller Gavin 
            Freeman stating that the 'underlying dryness' of the bush has led to exceptionally high fire danger."),
        h4("Weather in Australia", style = "color: #a84632;"),
        p("Australia's climate varies greatly throughout the eight states and territories; there 
            are four seasons across most of the country and a wet and dry season in the tropical north. 
            Australia's seasons are at opposite times to those in the northern hemisphere. 
            December to February is summer; March to May is autumn; June to August is winter; and September to November is spring.")
      )
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
      and for longer. We also learned that a decrease in rain can result in droughts, also a 
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

