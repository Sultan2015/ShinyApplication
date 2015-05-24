# server R

library(shiny)

scoring <- function(f1, f2, f3, f5, f6, f7, f8, f9, f10)
    {
        exponent <- 1.952419*f1-0.0148353*f2+0.4550756*f3-0.0000453*f5+0.0426992*f6+0.7992278*f7+0.0956227*f8+0.6783534*f9+0.0503101*f10-3.52365         
        logit <- 1/(1+exp(-exponent))
        percent <- 100*logit
        round <- round(percent, 2)
        return(round)
    }

shinyServer(
    function(input, output) 
    {
        output$prediction <- renderPrint({scoring(input$F_B, input$F_C, input$F_D, input$F_F, input$F_G, input$F_H, input$F_I, input$F_J, input$F_K)})
        output$plot <- renderPlot({
            logit_table <- read.csv("logit.csv")
            logit_table$percent <-100* logit_table$prob
            hist(logit_table$percent, xlab="Probability of default, %", breaks=50, main=NULL)
            shift <- scoring(input$F_B, input$F_C, input$F_D, input$F_F, input$F_G, input$F_H, input$F_I, input$F_J, input$F_K)
            lines(c(shift, shift), c(0, 70000), col="red")
        })
    }
)


