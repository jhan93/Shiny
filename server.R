#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(leaflet)
library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$predMPG <- renderText({
    data("mtcars")
    fit <- lm(mpg~factor(am) + cyl + hp + wt, data = mtcars)
    holder <- ifelse(input$transmission == 'Manual', '1', '0')
    predict(fit, data.frame(am = holder, cyl = input$cyl, hp = input$hp, wt = input$wt))
  })
})
