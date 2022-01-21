## COVOD Data Discovery

library(shiny)
library(datasets)
library(dplyr)
library(formattable)
library(DT)
library(ggplot2)

options(encoding = "UTF-8") #required to avoid: warning in readLines(con) incomplete final line

#need to consider http://shiny.rstudio.com/articles/datatables.html
options("scipen"=100)
options("scipen"=100)
covid_case_surv_co <- read.csv("./shiny/covid_case_surv_co.csv", header = TRUE)
covid_case_surv_ak <- read.csv("./shiny/covid_case_surv_ak.csv", header = TRUE)
covid_case_surv_ga <- read.csv("./shiny/covid_case_surv_ga.csv", header = TRUE)
covid_case_surv_fl <- read.csv("./shiny/covid_case_surv_fl.csv", header = TRUE)
covid_case_surv_mo <- read.csv("./shiny/covid_case_surv_mo.csv", header = TRUE)
covid_case_surv_ny <- read.csv("./shiny/covid_case_surv_ny.csv", header = TRUE)

# Define server logic required to summarize and view the 
# selected dataset
shinyServer(function(input, output) {
  
  observe_helpers(session = shiny::getDefaultReactiveDomain(),
                  help_dir = "helpfiles", withMathJax = FALSE)
  
  # Return the requested dataset
  
  datasetInput <- reactive({
    switch(input$dataset,
           "Alaska COVID Cases" = covid_case_surv_ak,
           "Colorado COVID Cases" = covid_case_surv_co,
           "Georgia COVID Cases" = covid_case_surv_ga,
           "Florida COVID Cases" = covid_case_surv_fl,
           "Missouri COVID Cases" = covid_case_surv_mo,
           "New York COVID Cases" = covid_case_surv_ny
    )
  })
  
  
  varnameInput<-reactive({
   if(input$varname=="status_num"){
     switch(input$varname,
            "Variable Name" = status_num)
   } else{}
     switch(input$varname,
            "Variable Name" = status_character)
  })
  
  output$view <- DT::renderDataTable({
    DT::datatable(datasetInput(), options=list(searching=FALSE, paging=FALSE, rownames=FALSE))
  })
  
  library(tidyverse)
  library(zoo)
  
  output$dataplot <- renderPlot(height=500,{
    par(mar=c(8.3, 4.1, 2, 1))  
    ggplot(datasetInput(), aes(x = (as.factor(as.yearmon(case_month))))) +
    geom_bar(stat = "count", fill="steelblue") +
    theme(axis.text.x = element_text(angle = -90, hjust = 0)) +
    labs(x= "Month",
         y = "Number of Cases",
         title = "COVID-19 Cases from January 2020 & December 2021")
  })

})
