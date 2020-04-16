# server.R
source("helpers.R") 
counties <- readRDS("data/counties.rds")
library(maps) 
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      vari <- switch(input$var, "Percent White" = counties$white,
	  "Percent Hispanic" = counties$hispanic,
	  "Percent Asian" = counties$asian, 
	  "Percent Black" = counties$black)  
	  
	  color <- switch (input$var, "Percent White" = "darkblue", 
	  "Percent Hispanic" = "darkred", 
	  "Percent Asian" = "magenta", 
	  "Percent Black" = "black")

	  legend <- switch (input$var, "Percent White" = "White %",
	  "Percent Hispanic" = "Hispanic %", 
	  "Percent Asian" = "Asian %" , 
	  "Percent Black" = "Black %")
	  
	  min <- input$range[1]
	  max <- input$range[2]
    
    percent_map(vari, color, legend, min, max)
    })
      
   }
 )
    