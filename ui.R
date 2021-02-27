#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Clusterization by Segments"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            actionButton("cite","Cite us."),
            fileInput('inputData','Load your dataset.',
                      multiple = F,
                      accept=c('text/csv',
                               'text/comma-separated-values,text/plain',
                               '.csv',
                               '.xlsx'))
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(
                tabPanel("Data",dataTableOutput("showTable")),
                tabPanel("Plot",plotOutput("showPlot")),
                tabPanel("Result",plotOutput("showResult"))
            )
        )
    )
))
