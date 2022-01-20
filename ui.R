library(tidyquant)
library(tidyverse)
library(shiny)
library(readr)
library(knitr)
library(maditr)
library(dplyr)
library(expss)
library(qvalue)
library(jsonlite)
library(shiny)
library(shinydashboard)
library(colourpicker)

url1 = "https://github.com/stricje1/ddp4/blob/gh-pages/hedenfalk.csv"
hedenfalk <- read.csv("C:/Users/jeff/Documents/R/ddp4/hedenfalk.csv", header=FALSE)
# Then we can call the jsonlite::fromJSON() library function to fetch the JSON data from the RESTful API URL, and convert the JSON object to a matrix.

url2 <- "https://data.cdc.gov/resource/n8mc-b4w4.json"
covid <- jsonlite::fromJSON(url2)
covid_total_cases <-data.frame(covid)

url3 = "C:/Users/jeff/Documents/R/ddp4/Weekly_Covid_Deaths_by_States.csv"
cdc_weekly <- read.csv(url3)
cdc_disease_tracking <- data.frame(cdc_weekly)

options(shiny.sanitize.errors = TRUE)

#qobj <- qvalue(p = hedenfalk$p, lambda=0.95, min = 0, max = 1)

# Define UI for dataset viewer app ----
ui <- fluidPage(
  tags$style('.container-fluid {
                             background-color: #fff5ee;
              }'),
  
  # App title ----
  titlePanel("Data Set Selection"),
  
  infoBox("About the Datasets: The first two data bases are CDC data products. CDC Weekly Disease tracking for January 2020 to January 2022. CDC COVID-19 is tracking data for Total Cases dein January 2020 to Jannuary 2022. The last dataset is Q-values/p-values. A p-value is an area in the tail of a distribution that tells you the odds of a result happening by chance. A Q-value is a p-value that has been adjusted for the False Discovery Rate(FDR). The False Discovery Rate is the proportion of false positives you can expect to get from a test.", subtitle=NULL, color="orange", width=4, fill=TRUE),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(width = 4, 
                 
                 # Input: Text for providing a caption ----
                 # Note: Changes made to the caption in the textInput control
                 # are updated in the output area immediately as you type
                 textInput(inputId = "caption",
                           label = "Caption:",
                           value = "Data Summary"),
                 
                 # Input: Selector for choosing dataset ----
                 # Data sets can be added or removed from outside the app,
                 # the top of the code above `ui <- fluidPage`.
                 selectInput(inputId = "dataset",
                             label = "Choose a dataset:",
                             choices = c("cdc_disease_tracking", 
                                         "covid_total_cases", 
                                         "qobj")),
                 
                 # Input: Numeric entry for number of obs to view ----
                 numericInput(inputId = "obs",
                              label = "Number of observations to view:",
                              value = 10)
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(width = 10,
              
              # Output: Formatted text for caption ----
              h3(textOutput("caption", container = span)),
              
              # Output: Verbatim text for data summary ----
              verbatimTextOutput("summary"),
              
              # Output: HTML table with requested number of observations ----
              tableOutput("view"),
              
#              verbatimTextOutput("error"),
              
              plotOutput("plot1")
    )
  )
)