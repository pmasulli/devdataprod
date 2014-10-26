library(shiny)

stateStat <- data.frame(state.x77)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  #output$statOut <- renderPlot({
  #  x    <- faithful[, 2]  # Old Faithful Geyser data
  #  bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
  #output$statOut <-  renderText({"aaa "+ input$population})
  
  #dataSubset <- subset(stateStat[c("Population",input$radio)],Population > input$population[1] & Population < input$population[2])
  
  output$table1 <- renderTable({ 
    subset(stateStat[c("Population",input$radio)],Population > input$population[1] & Population < input$population[2])
    })
  
  output$plot <- renderPlot({
    dataSubset <- subset(stateStat[c("Population",input$radio)],Population > input$population[1] & Population < input$population[2])
    hist(as.numeric(unlist(dataSubset[input$radio])),main=paste("Distribution of",input$radio),xlab="")
  })
  
  output$text1 <- renderText({
    dataSubset <- subset(stateStat[c("Population",input$radio)],Population > input$population[1] & Population < input$population[2])
    paste("The average value of",
                input$radio,
                "for the states you selected is ",
                round(mean(as.numeric(unlist(dataSubset[input$radio]))),2)
                )
          
  })
  
})
