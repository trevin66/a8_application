library(shiny)
library(plotly)
library(dplyr)

source('build_scatter.R')

shinyServer(function(input, output) {
  output$scatter <- renderPlotly({ 
    build_scatter(iris, input$xvar, input$yvar, input$slider1, input$slider2)  
  })
})