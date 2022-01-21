library(shiny)
library(shinythemes)
library(dplyr)
library(shinyhelper)

# Define UI for dataset viewer application
shinyUI(fixedPage(theme = shinytheme("flatly"),
                  
                  # Application title.
                  titlePanel("Covid Data"),
                  
                  fixedRow(
                    column(3,
                           selectInput("dataset", "Choose a dataset:", 
                                       choices = c("Alaska COVID Cases",
                                                   "Colorado COVID Cases", 
                                                   "Georgia COVID Cases",
                                                   "Florida COVID Cases",
                                                   "Missouri COVID Cases",
                                                   "New York COVID Cases"))%>% 
                             helper(icon = "question",
                                    colour = "green",
                                    type = "inline",
                                    content = c("Dataset Help:",
                                                "Choose a set from the pulldown menu."),
                                    buttonLabel = "Got it!",
                                    easyClose = FALSE,
                                    fade = TRUE,
                                    size = "s"),
                           
                           radioButtons("varname", "Variable Name", 
                                        c("status_num", "status_character")) %>% 
                             helper(icon = "question",
                                    colour = "green",
                                    type = "inline",
                                    content = c("Variable Help:",
                                                "The variable select buttons work,",
                                                "but they are not connected to any",
                                                "fucntional code yet."),
                                    buttonLabel = "Got it!",
                                    easyClose = FALSE,
                                    fade = TRUE,
                                    size = "s"),
                           br(),
                           br()
                    ),
                    
                    column(9,
                           
                           tabsetPanel(
                             
                             h4("Selected Covid Data"),
                             tabPanel("Data Table", DT::dataTableOutput("view"), value="thistab"),
                             tabPanel("Covid Plot", plotOutput("dataplot")),
                             tabPanel("Documentation", includeMarkdown("data_discovery_help.md")),
                             selected = "thistab"
                             
                           )
                           
                    )
                  )
))

