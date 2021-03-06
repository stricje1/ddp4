---
title: "Data Discovery Documentation"
author: "Jeffrey Strickland"
date: "1/19/2022"
runtime: shiny
output: html_document
---

## Welcome to my Shiny Application

This application is prepared to satisfy the project requirements for the Coursera Course [*Developing Data Products*](https://www.coursera.org/learn/data-products/) provided by Johns Hopkins University.  Developing Data Products is course 9 of 10 in the Data Science Specialization.

### The requirements for the project are:

1. Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
2. Deploy the application on RStudio's shiny server
3. Share the application link by pasting it into the provided text box
4. Share your server.R and ui.R code on github

### The application must include the following:

1. Some form of input (widget: textbox, radio button, checkbox, ...)
2. Some operation on the ui input in sever.R
3. Some reactive output displayed as a result of server calculations
4. You must also include enough documentation so that a novice user could use your application.
5. The documentation should be at the Shiny website itself. Do not post to an external link.

## How to Use

The COVID-19 Data Discovery app is comprised of easy to use user input (ui) with two basic entries:
  1. Choosing a datasetInput
  2. Selecting variables to plot

There are currently six datasets from Centers of Disease Control (CDC) data products:
  1. CDC Monthly Disease tracking for Alaska from January 2020 to December 2021. 
  2. CDC Monthly Disease tracking for Colorado from January 2020 to December 2021.
  3. CDC Monthly Disease tracking for Georgia from January 2020 to December 2021.
  4. CDC Monthly Disease tracking for Florida from January 2020 to December 2021.
  5. CDC Monthly Disease tracking for Missouri from January 2020 to December 2021.
  6. CDC Monthly Disease tracking for New York from January 2020 to December 2021.
  
Tables can be added in the header of the source code, before the server code. Selecting a database results in a summary table, n-observations of the data set, and a plot of the first six variables.


The datasets can imported from the following site as CSV or JSON file formats:

"https://data.cdc.gov/Case-Surveillance/COVID-19-Case-Surveillance-Public-Use-Data-with-Ge/n8mc-b4w4/data"


These files can be imported in RStudio as JSON (faster download than CSV) using, for example:

```{r}  
url = "https://data.cdc.gov/resource/n8mc-b4w4.json"
covid <- jsonlite::fromJSON(url)
```

Future versions of the app will allow datasets to be loaded in the user interface and selecting variables for plotting with be available also.

The source code for the data (ui and server) can be accessed at https://github.com/stricje1/ddp4
