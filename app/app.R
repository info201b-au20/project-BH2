# Load the shiny, ggplot2, and dplyr libraries
library("shiny")
library("ggplot2")
library("dplyr")
library("markdown")
library("shinyWidgets")
library("leaflet")
library("plotly")
library("readr")
library("markdown")
library("shinythemes")

# Use source() to execute the `app_ui.R` and `app_server.R` files. These will
# define the UI value and server function respectively.
source("app_ui.R")
source("app_server.R")

shinyApp(ui = ui, server = server)
