# ui.R

library(shiny)


shinyUI(
    pageWithSidebar(
        # Application title
        headerPanel("Credit risk scoring"),
        sidebarPanel(
            numericInput('F_C', 'Age', 18, min=18),
            numericInput('F_K', 'Number of dependents', 0, min=0, step=1),
            numericInput('F_F', 'Monthly income', 0, min=0, step=1),
            numericInput('F_B', 'Utilization of unsecured lines', 0, min=0, max=1),
            numericInput('F_G', 'Open credit lines and loans', 0, min=0, step=1),
            numericInput('F_I', 'Real estate lines and loans', 0, min=0, step=1),
            numericInput('F_D', 'Number of times 30-59 days late', 0, min=0, step=1),
            numericInput('F_J', 'Number of times 60-89 days late', 0, min=0, step=1),
            numericInput('F_H', 'Number of times 90 days late', 0, min=0, step=1),
            submitButton('Submit')
        ),
        mainPanel(
            h3("Instructions"),
            p("Please fill borrower parameters in the input fields and click Submit button. The estimated probability of default will be calculated immediately. *"),
            h3("Probability of default for this borrower, %"),
            verbatimTextOutput("prediction"),
            h3("Borrower VS Sample"),
            p("Now lets see where is the borrower in the total distribution of the learning dataset"),
            plotOutput("plot"),
            p("* The model was trained on a huge semi-artificial educational dataset using logistic regression. The model has not very high accuracy, but is is fast and easy to implement for prediction.")
            
        )
    )
)
