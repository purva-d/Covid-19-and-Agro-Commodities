#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(tidyverse)
library(lubridate)
# Define server logic required to draw a histogram
shinyServer(function(session, input, output) {
    ## country_name is country name
    observeEvent(
        input$Country,
        updateSelectInput(session, "Market",  
                          choices = foodData$mkt_name[foodData$country_name == input$Country]
        ))
    
    # Update as soon as Month gets populated according to the year and month selected
    observeEvent(
        input$Market,
        updateSelectInput(session, "Commodity",  
                          choices = foodData$cm_name[foodData$country_name == input$Country & foodData$mkt_name == input$Market]
        ))
    
    output$timeseriesPlot <- renderPlot({
        sortData <- filter(foodData,
                           country_name == input$Country & mkt_name == input$Market & cm_name == input$Commodity
        )
        sortData <- as.data.frame(sortData)
        sortData <- na.omit(sortData)
        if(is_empty(sortData)){
            ouput$plotStatus <- "No Data Hence No Plot"
        }
        else{
            curname <- paste("Price in ",unique(sortData$cur_name))
            ggplot(sortData, aes(x=dmy(Date),y=mp_price)) +
                geom_point()+geom_line() + geom_smooth(na.rm = TRUE,method = "loess")+ 
                labs(title = "Food prices", x = "Date", y = curname)
        }
        
    })
    
})

