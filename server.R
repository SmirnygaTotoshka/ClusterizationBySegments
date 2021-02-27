#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(readxl)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    dataset <- reactive({
        if (is.null(input$inputData)){
            return()
        }
        path = input$inputData$datapath
        info = file.info(path)
        if(info$size >= 2^30)
            return(NA)#TODO - throw exception. Too big dataset
        if(info$dir)
            return(NA)#TODO - throw exception. path is dir.
        mydata <- read.csv(input$file1$datapath,
                           header=TRUE, sep=',')
        return(mydata)
    })
    

})
