#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
#install.packages('leaflet')
library(leaflet)
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict MPG"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput('cyl',
                   'Number of Cylinders',
                   min = 4,
                   max = 10,
                   value = 6),
       sliderInput('wt',
                   'Weight (1,000 lbs)',
                   min = 1,
                   max = 6,
                   value = 3),
       sliderInput('hp',
                   'Gross Horsepower',
                   min = 40,
                   max = 350,
                   value = 123),
       selectInput("transmission", "Choose a Transmission",
                     choices = c("Manual", "Automatic"),
       )
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h1('Prediction: ', textOutput("predMPG"), ' MPG'),
      h4('Documentation'),
      h6('Utilize the features to the left to predict the MPG of a car. You are able to input (using the sliders) the number of cylinders,
         the weight (in 1,000 lbs), hp and transmission. We have fit a linear model to the mtcars data set to create a model to help predict
         the MPG of the car you are looking at.')
    )
  )
))
