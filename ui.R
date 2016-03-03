library(shiny)
library(plotly)
library(dplyr)

shinyUI(fluidPage('Iris Dimensions',
                   # Create title
                    titlePanel('Iris Variables'),
                        # Create sidebar and sidepanel controls
                        sidebarLayout(
                          sidebarPanel(
                            # Inputs to select variable to scatter
                              selectInput("xvar", label = h3("X Variable"), 
                                            choices = list("Sepal Length" = 'Sepal.Length', "Sepal Width" = 'Sepal.Width', "Petal Length" = 'Petal.Length', "Petal Width" = 'Petal.Width'), 
                                            selected = 'Sepal.Length'), 
                                
                              selectInput("yvar", label = h3("Y Variable"), 
                                            choices = list("Sepal Length" = 'Sepal.Length', "Sepal Width" = 'Sepal.Width', "Petal Length" = 'Petal.Length', "Petal Width" = 'Petal.Width'), 
                                            selected = 'Sepal.Width'),
                              
                              # Slider for the X variable range
                              sliderInput("slider1", label = h3("X Variable Range"), min = 0, 
                                          max = 10, value = c(0, 10), step = 0.1),
                              
                              # Slider for the Y variable range
                              sliderInput("slider2", label = h3("Y Variable Range"), min = 0, 
                                          max = 10, value = c(0, 10), step = 0.1)
                              ),
                              
                              # Main panel for displaying plotly map
                              mainPanel(
                                plotlyOutput('scatter')
                              )
                            )
                   
))