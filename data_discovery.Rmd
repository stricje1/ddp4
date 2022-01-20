---
title: "Data Discovery Documentation"
author: "Jeffrey Strickland"
date: "1/19/2022"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
The Data Discovery app is comprised of easy to use user input (ui) with two basic entries:
  1. Choosing a datasetInput
  2. Selecting the number of obseration you want to View

There are currently to datasets, both are Centers of Disease Control (CDC) data products:
  1. CDC Weekly Disease tracking for January 2020 to January 2022. 
  2. CDC COVID-19 is tracking data for Total Cases dein January 2020 to Jannuary 2022.
  
Tabes can be added in the header of the source code, before the ui. Selecting a database results in a summary table, n-observations of the data set, and a plot of the first six variables.

The Data Summary shows:
  1. As-of-date of the data
  2. Length of the dataset (number or rows)
  3. The class of the data field (character, numeric, etc.)
  4. Data descriptive statistics
    a. Minimum value
    b. 1st Quartile
    c. Median value
    d. mean value
    e. 3rd Quartile
    f. Maximum value

Below the Data Summary is the n-rows of data, where n can be changed with the input in the ui, "Number of observations to view:"

Below the dataset view is a plot of the first six variables of the dataset. THe plot changes for each database selected.

The datasets were imported from the following sites as CSV or JSON file formats:
* "https://data.cdc.gov/api/views/muzy-jte6/rows.csv?accessType=DOWNLOAD&bom=true&format=true"
* "https://data.cdc.gov/resource/n8mc-b4w4.json"

These files can be imported in RStudio using, for example:

```{r}  
url = "https://data.cdc.gov/resource/n8mc-b4w4.json"
covid <- jsonlite::fromJSON(url)
```

Future versions of the app will allow datasets to be loaded in the user interface and selecting variables for plotting with be available also.

The source code for the data (ui and server) can be accessed at https://github.com/stricje1/ddp4
