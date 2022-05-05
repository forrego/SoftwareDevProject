#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(scales)
library(ggspatial) 
library(dplyr)
library(ggplot2)
library(leaflet)
library(RCurl)
library(plotly)
library(shinydashboard)
library(hrbrthemes)
library(zoo)
library(treemap)


df <- read_csv("sprin2_gold_line.csv")
df_gold_fixed <- read_csv("optimal_route_gold_line.csv")
df_green_fixed <- read_csv("optimal_route_green_line.csv")
df_silver_fixed <- read_csv("optimal_route_silver_line.csv")
# Define UI for application that draws a histogram
hrbrthemes::import_roboto_condensed()
# Define UI for application that draws a histogram
ui <- dashboardPage(

    # Application title
    dashboardHeader(title = "Optimized Niner Transit System"),

    
    dashboardSidebar(
        sidebarMenu(
            menuItem("Old routes", tabName = "old", icon = icon("home")),
            menuItem("Optimal routes", tabName = "optimal", icon = icon("home"),
                     startExpanded = TRUE, menuSubItem("Gold Line", tabName = "goldFixed"),
                     menuSubItem("Green Line", tabName = "greenFixed"),
                     menuSubItem("Silver Line", tabName = "silverFixed"))
        )

       
        
    ),
    dashboardBody(
      h2("Optimized Niner Transit System"),
      
      tabItems(
        tabItem(
          tabName = "old",
          sidebarLayout(
            sidebarPanel(
            ),
            mainPanel(
              tabsetPanel(
                tabPanel("On", leafletOutput("on")),
                hr(),
                tabPanel("Off", leafletOutput("off"))
              )
            )
          )
          ),
        tabItem(
          tabName = "goldFixed",
          sidebarLayout(
            sidebarPanel(
              h3("New Stops:"),
              h3("Hunt Hall"),
              h3("Wallis Hall E/Light Rail"),
              h3("Student Union W"),
              h3("Levine Hall W"),
              h3("Fretwell S")
            ),
            mainPanel(
              tabsetPanel(
                tabPanel("On", leafletOutput("goldOnFixed")),
                hr(),
                tabPanel("Off", leafletOutput("goldOffFixed"))
              )
            )
          )
        ),
        tabItem(
          tabName = "greenFixed",
          sidebarLayout(
            sidebarPanel(
              h3("New Stops:"),
              h3("Wallis Hall W/Light Rail"),
              h3("Student Union E"),
              h3("Student Health N"),
              h3("South Village Deck")
            ),
            mainPanel(
              tabsetPanel(
                tabPanel("On", leafletOutput("greenOnFixed")),
                hr(),
                tabPanel("Off", leafletOutput("greenOffFixed"))
              )
            )
          )
        ),
        tabItem(
          tabName = "silverFixed",
          sidebarLayout(
            sidebarPanel(
              h3("New Stops:"),
              h3("CRI Deck"),
              h3("Lot 5A"),
              h3("Lot 6"),
              h3("Martin Hall"),
              h3("Portal W"),
              h3("Student Union W")
            ),
            mainPanel(
              tabsetPanel(
                tabPanel("On", leafletOutput("silverOnFixed")),
                hr(),
                tabPanel("Off", leafletOutput("silverOffFixed"))
              )
            )
          )
        )
        )
        
)
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$on <-renderLeaflet({
         leaflet(df) %>%
             addTiles() %>%
             addCircleMarkers( lng=df$Long, lat = df$Lat,
                                                         popup= paste("Stop: ", df$Stop, "<br>", "Average number of passengers getting on: ", df$On),
                                                         radius = df$On/5,
                                                         color = "red",
                                                         stroke=FALSE,
                                                        fillOpacity = 0.5)
  })
  
  output$off <-renderLeaflet({
    leaflet(df) %>%
      addTiles() %>%
      addCircleMarkers( lng=df$Long, lat = df$Lat,
                        popup= paste("Stop: ", df$Stop, "<br>", "Average number of passengers getting off: ", df$Off),
                        radius = df$Off/5,
                        color = "blue",
                        stroke=FALSE,
                        fillOpacity = 0.5)
  })
  
  output$goldOnFixed <-renderLeaflet({
    leaflet(df_gold_fixed) %>%
      addTiles() %>%
      addCircleMarkers( lng=df_gold_fixed$Long, lat = df_gold_fixed$Lat,
                        popup= paste("Stop: ", df_gold_fixed$Stop, "<br>", "Average number of passengers getting on: ", df_gold_fixed$On),
                        radius = df_gold_fixed$On/5,
                        color = "red",
                        stroke=FALSE,
                        fillOpacity = 0.5)
  })
  
  output$goldOffFixed <-renderLeaflet({
    leaflet(df_gold_fixed) %>%
      addTiles() %>%
      addCircleMarkers( lng=df_gold_fixed$Long, lat = df_gold_fixed$Lat,
                        popup= paste("Stop: ", df_gold_fixed$Stop, "<br>", "Average number of passengers getting off: ", df_gold_fixed$Off),
                        radius = df_gold_fixed$Off/5,
                        color = "blue",
                        stroke=FALSE,
                        fillOpacity = 0.5)
  })
  
  output$greenOnFixed <-renderLeaflet({
    leaflet(df_green_fixed) %>%
      addTiles() %>%
      addCircleMarkers( lng=df_green_fixed$Long, lat = df_green_fixed$Lat,
                        popup= paste("Stop: ", df_green_fixed$Stop, "<br>", "Average number of passengers getting on: ", df_green_fixed$Off),
                        radius = df_green_fixed$Off/5,
                        color = "red",
                        stroke=FALSE,
                        fillOpacity = 0.5)
  })
  
  output$greenOffFixed <-renderLeaflet({
    leaflet(df_green_fixed) %>%
      addTiles() %>%
      addCircleMarkers( lng=df_green_fixed$Long, lat = df_green_fixed$Lat,
                        popup= paste("Stop: ", df_green_fixed$Stop, "<br>", "Average number of passengers getting off: ", df_green_fixed$Off),
                        radius = df_green_fixed$Off/5,
                        color = "blue",
                        stroke=FALSE,
                        fillOpacity = 0.5)
  })
  
  output$silverOnFixed <-renderLeaflet({
    leaflet(df_silver_fixed) %>%
      addTiles() %>%
      addCircleMarkers( lng=df_silver_fixed$Long, lat = df_silver_fixed$Lat,
                        popup= paste("Stop: ", df_silver_fixed$Stop, "<br>", "Average number of passengers getting off: ", df_silver_fixed$Off),
                        radius = df_silver_fixed$Off/5,
                        color = "red",
                        stroke=FALSE,
                        fillOpacity = 0.5)
  })
  
  output$silverOffFixed <-renderLeaflet({
    leaflet(df_silver_fixed) %>%
      addTiles() %>%
      addCircleMarkers( lng=df_silver_fixed$Long, lat = df_silver_fixed$Lat,
                        popup= paste("Stop: ", df_silver_fixed$Stop, "<br>", "Average number of passengers getting off: ", df_silver_fixed$Off),
                        radius = df_silver_fixed$Off/5,
                        color = "blue",
                        stroke=FALSE,
                        fillOpacity = 0.5)
  })
    #output$type <- renderLeaflet({
        # generate bins based on input$bins from ui.R
        #x    <- faithful[, 2]
        #bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    #})
}

# Run the application 
shinyApp(ui = ui, server = server)
