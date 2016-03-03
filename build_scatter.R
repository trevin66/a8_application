library(shiny)
library(plotly)
library(dplyr)

build_scatter <- function(data, xvar, yvar, slider1, slider2) {
  # Filter down to selected columns and set the min/max for those columns
   df <- filter_(data, paste(xvar, ">", slider1[1]), paste(xvar, "<", slider1[2]), paste(yvar, ">", slider2[1]), paste(yvar, "<", slider2[2]))
  # Get the max and min numbers for x and y to be used in layout 
  xmin <- slider1[1] - 0.25 
  xmax <- slider1[2] + 0.25
  ymin <- slider2[1] - 0.25
  ymax <- slider2[2] + 0.25
 
  # Draw the graph
  df %>% 
    plot_ly(x = eval(parse(text = xvar)), 
            y = eval(parse(text = yvar)), 
            mode = "markers",
            marker = list(
                 opacity = .4, 
                 size = 10
            ),
            color = Species
            ) %>% 
    
    # Set the layout with axis title, variiables and 
    layout(xaxis = list(range = c(xmin, xmax), title = xvar), 
           yaxis = list(range = c(ymin, ymax), title = yvar),
           hovermode = 'closest'
           
    ) %>% 
    return()
}




