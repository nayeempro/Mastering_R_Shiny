
#problem 2:
# Carefully read the documentation for sliderInput() to figure 
# out how to create a date slider, as shown below.



library(shiny)

ui <- fluidPage(
  sliderInput("date","Choose your Date",
              min = as.Date("2023-01-01"),
              max = as.Date("2024-12-31"),
              value = c(as.Date("2023-06-11"), as.Date("2024-01-31"))
              )
)

server <- function(input, output, session) {
  
}

shinyApp(ui, server)



#Problem 3
# Create a slider input to select values between 0 and 100 where 
# the interval between each selectable value on the slider is 5.
# Then, add animation to the input widget so when the user presses
# play the input widget scrolls through the range automatically.


library(shiny)

# Define the UI
ui <- fluidPage(
  titlePanel("Slider Input with Animation Example"),
  sidebarLayout(
    sidebarPanel(
      # Create a slider input with a step interval of 5 and add animation
      sliderInput("num", "Select a value:",
                  min = 0, max = 100, value = 0, step = 5,
                  animate = animationOptions(interval = 1000, loop = TRUE))
    ),
    mainPanel(
      # Display the selected value
      textOutput("selectedValue")
    )
  )
)

# Define the server logic
server <- function(input, output, session) {
  output$selectedValue <- renderText({
    paste("Selected value is:", input$num)
  })
}

# Run the application
shinyApp(ui = ui, server = server)


#========OUTPUT Exercise==============

PROBLEM 01:
Which of textOutput() and verbatimTextOutput() should each 
of the following render functions be paired with?
  
1.renderPrint(summary(mtcars))

library(shiny)

ui <- fluidPage(
  verbatimTextOutput("summary")
  )

server <- function(input, output, session) {
  
  output$summary <- renderPrint(summary(mtcars))
  
}

shinyApp(ui, server)


###### 2.renderText("Good morning!")

library(shiny)

ui <- fluidPage(
  textOutput("txt")
)

server <- function(input, output, session) {
  output$txt <- renderText("Good morning!")
}

shinyApp(ui, server)




####3.renderPrint(t.test(1:5, 2:6))

library(shiny)

ui <- fluidPage(
  verbatimTextOutput("summary")
)

server <- function(input, output, session) {
  
  output$summary <- renderPrint(t.test(1:5, 2:6))
  
}

shinyApp(ui, server)




############ 4.renderText(str(lm(mpg ~ wt, data = mtcars)))

library(shiny)

ui <- fluidPage(
  verbatimTextOutput("summary")
)

server <- function(input, output, session) {
  
  output$summary <- renderPrint((lm(mpg ~ wt, data = mtcars)))
  
}

shinyApp(ui, server)
