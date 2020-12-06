#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    # Application title
    titlePanel("Food Prices since Jan 2019"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            
            selectInput(inputId =  "Country",label =  "Country:",
                        choices = unique(foodData$country_name),
                        selected = NULL
            ),
            selectInput(inputId =  "Market",label =  "Market:",
                        choices = "",selected = NULL
            ),
            selectInput(inputId =  "Commodity",label =  "Commodity:",
                        choices = "",selected = NULL
            )
        ),
        
        
        # Show a plot of the generated distribution
        mainPanel(
            textOutput("plotStatus"),
            plotOutput("timeseriesPlot")
        )
    )
))

