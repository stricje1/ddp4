# Define server logic to summarize and view selected dataset ----
server <- function(input, output) {
  
  # Return the requested dataset ----
  # By declaring datasetInput as a reactive expression we ensure
  # that:
  #
  # 1. It is only called when the inputs it depends on changes
  # 2. The computation and result are shared by all the callers,
  #    i.e. it only executes a single time
  datasetInput <- reactive({
    switch(input$dataset,
           "cdc_disease_tracking" = cdc_disease_tracking,
           "covid_total_cases" = covid_total_cases,
           "qobj" = qobj)
  })
  
  # Create caption ----
  # The output$caption is computed based on a reactive expression
  # that returns input$caption. When the user changes the
  # "caption" field:
  #
  # 1. This function is automatically called to recompute the output
  # 2. New caption is pushed back to the browser for re-display
  #
  # Note that because the data-oriented reactive expressions
  # below do not depend on input$caption, those expressions are
  # NOT called when input$caption changes
  output$caption <- renderText({
    input$caption
  })
  
  # Generate a summary of the dataset ----
  # The output$summary depends on the datasetInput reactive
  # expression, so will be re-executed whenever the input$dataset
  # changes
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  
  # Show the first "n" observations ----
  # The output$view depends on both the databaseInput reactive
  # expression and input$obs, so it will be re-executed whenever
  # input$dataset or input$obs is changed
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  output$plot1 <- renderPlot({
    dataset <- datasetInput()
    d <- dataset
    plot(d[,1:6,])
  })
  
#  output$error <- renderText({
    "LOG: The Hedabenfalk dataset is a vector with -inf and inf values. 
    Theoretically, q-values are bound by (0, 1), so the tables 
    allows -inf and inf but these cannot be calculated. A p-value 
    is an area in the tail of a distribution that tells you the 
    odds of a result happening by chance. A Q-value is a p-value 
    that has been adjusted for the False Discovery Rate(FDR). 
    The False Discovery Rate is the proportion of false positives 
    you can expect to get from a test.})"
}