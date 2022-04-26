library(shiny)
library(readr)
library(haven)
library(shinydashboard)

shinyUI(
  
  
  dashboardPage(
    dashboardHeader(title=h3("MMI app")),
    dashboardSidebar(titlePanel(title=h4("Kontrollpanel", align="center")),
                     selectInput("parti", "Velg parti",
                                 choices= c("Ap","Høyre","Frp","SV","Sp","KrF","Venstre","MDG","Rødt"), multiple=TRUE),
                     dateInput("fra", "Fra:", value = min(mmi$date), min =min(mmi$date), max=max(mmi$date),
                               format = "mm/dd/yy"),
                     dateInput("til","Til:", value=max(mmi$date), max=max(mmi$date), format="mm/dd/yy"),
                     selectInput("sperre","Vis sperregrensen", choices=c("Ja","Nei"), selected="Nei"),
                     sliderInput("span", "Linearitet:",min = 0.1, max = 1,value=c(0.25)),
                     sliderInput("konf", "Konfidensintervall:",min = 0.90, max = 0.99,value=c(0.99))),
    dashboardBody(plotOutput("plot2",  height = "800", width = "100%"))
  )
  
  
  


)