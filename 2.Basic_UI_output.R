#Text Output

library(shiny)

ui <- fluidPage(
  textOutput("text"),
  verbatimTextOutput("code")
)
server <- function(input, output, session) {
  output$text <- renderText({ 
    "Hello friend!" 
  })
  output$code <- renderPrint({ 
    summary(1:10) 
  })
}

shinyApp(ui,  server)


#Table Output

library(shiny)

ui <- fluidPage(
  tableOutput("static"),
  dataTableOutput("dynamic") #data
)
server <- function(input, output, session) {
  output$static <- renderTable(head(mtcars))
  output$dynamic <- renderDataTable(mtcars, options = list(pageLength = 5))
}

shinyApp(ui, server)


#plot output

library(shiny)

ui <- fluidPage(
  plotOutput("plot", width = "400px")
)
server <- function(input, output, session) {
  output$plot <- renderPlot(plot(1:5), res = 96)
}

shinyApp(ui, server)





#problem 3
# Re-create the Shiny app from Section 2.3.3, this time setting 
# height to 300px and width to 700px. Set the plot “alt” text 
# so that a visually impaired user can tell that its a 
# scatterplot of five random numbers.






library(shiny)

# Define the UI
ui <- fluidPage(
  titlePanel("Scatterplot of Five Random Numbers"),
  sidebarLayout(
    sidebarPanel(
      # Add an input to refresh the plot with new random numbers
      actionButton("refresh", "Refresh Plot")
    ),
    mainPanel(
      # Output the plot with specified dimensions and alt text
      plotOutput("scatterPlot", height = "300px", width = "700px")
    )
  )
)


# Define the server logic
server <- function(input, output, session) {
  
  # Reactive expression to generate random numbers
  random_numbers <- reactive({
    input$refresh # This makes the plot update when the button is clicked
    rnorm(5)
  })
  
  # Render the scatterplot
  output$scatterPlot <- renderPlot({
    plot(random_numbers(), 
         xlab = "X-axis", ylab = "Y-axis", 
         main = "Scatterplot of Five Random Numbers")
  })
}

# Run the application
shinyApp(ui = ui, server = server)



