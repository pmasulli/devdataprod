library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("US Population statistics"),
  
  p(
    "This application displays statistical data about US states, according to the size of the state."
  ),
  p("You can select the interval of population (expressed in thousands) in the slider control below in the left pane, and the right pane will display two tabs containing a table and a frequency histogram for the considered statistic. Moreover it computes the mean value"),
  p("You can select the following statistics: Income (per capita income, 1974), Illiteracy (percent of population, 1970) and Life Expectancy (in years, 1969-1971)."),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("population",
                  "State population (thousands):",
                  min = 300,
                  max = 22000,
                  value = c(1000,5000)),
      # Copy the chunk below to make a group of checkboxes
      radioButtons("radio", label = p("Statistics"), 
                         choices = c("Income","Illiteracy","Life.Exp"),
                         selected = "Income")
    ),
    # Show a plot of the generated distribution
    mainPanel({
     # tableOutput("table1")
      tabsetPanel(type = "tabs", 
                  tabPanel("Table", textOutput("text1"), tableOutput("table1")),
                  tabPanel("Plot", plotOutput("plot"))
      )
    })
  )
))
