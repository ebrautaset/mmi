library(dplyr)
library(ggplot2)
library(scales)
library(shiny)
library(readr)
library(haven)



shinyServer(function(input,output){
  
    
    dat<-reactive({
      test <- mmi[mmi$date %in% seq(from=min(input$fra),to=max(input$til),by=1),]
      test
      
    })
  
  output$plot2<-renderPlot({
    
    if(input$sperre == "Ja") {
      p = ggplot(data=dat(),aes_string(x="date",frame="date"))
      if('Venstre' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes_string(y="Venstre"),shape=21,fill="forestgreen", color="black")+geom_smooth(aes_string(x="date",y="Venstre"), color="forestgreen", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('Ap' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=Ap),shape=21,fill="red", color="black")+geom_smooth(aes_string(x="date",y="Ap"), color="red", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('Høyre' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=Høyre),shape=21,fill="royalblue", color="black")+geom_smooth(aes_string(x="date",y="Høyre"), color="royalblue", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('Frp' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=Frp),shape=21,fill="darkviolet", color="black")+geom_smooth(aes_string(x="date",y="Frp"), color="darkviolet", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('SV' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=SV),shape=21,fill="deeppink", color="black")+geom_smooth(aes_string(x="date",y="SV"), color="deeppink", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('Sp' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=Sp),shape=21,fill="chartreuse", color="black")+geom_smooth(aes_string(x="date",y="Sp"), color="chartreuse", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('KrF' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=KrF),shape=21,fill="yellow1", color="black")+geom_smooth(aes_string(x="date",y="KrF"), color="yellow1", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('MDG' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=MDG),shape=21,fill="greenyellow", color="black")+geom_smooth(aes_string(x="date",y="MDG"), color="greenyellow", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('Rødt' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=Rødt),shape=21,fill="firebrick4", color="black")+geom_smooth(aes_string(x="date",y="Rødt"), color="firebrick4", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      p=p+geom_hline(yintercept=0.04, colour="red", size=1, linetype="dashed")
      p=p+scale_y_continuous(labels=scales::percent_format(1))
      p=p+labs(title= (
        if(length(input$parti) < 1) {"Velg parti i kontrollpanelet til venstre"} else {                  paste0("Målinger for ",sub(",([^,]*)$", " og\\1", paste(input$parti,collapse=", ")) )}
        
      )
      ,             subtitle=paste0("Fra ", 
                                    
                                    format(input$fra, format="%d. %B %Y")
                                    
                                    
                                    
                                    ," til ",
                                    
                                    
                                    format(input$til, format="%d. %B %Y")
      ),
             x= "Dato",
             y="Oppslutning",
             caption="Brautaset MMI. PollofPolls.no")
      p=p+theme_bw()+theme(text = element_text(size=16),
              axis.text.x = element_text(angle=0))
      p
    } else {
      p = ggplot(data=dat(),aes_string(x="date",frame="date"))
      if('Venstre' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes_string(y="Venstre"),shape=21,fill="forestgreen", color="black")+geom_smooth(aes_string(x="date",y="Venstre"), color="forestgreen", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('Ap' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=Ap),shape=21,fill="red", color="black")+geom_smooth(aes_string(x="date",y="Ap"), color="red", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('Høyre' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=Høyre),shape=21,fill="royalblue", color="black")+geom_smooth(aes_string(x="date",y="Høyre"), color="royalblue", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('Frp' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=Frp),shape=21,fill="darkviolet", color="black")+geom_smooth(aes_string(x="date",y="Frp"), color="darkviolet", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('SV' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=SV),shape=21,fill="deeppink", color="black")+geom_smooth(aes_string(x="date",y="SV"), color="deeppink", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('Sp' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=Sp),shape=21,fill="chartreuse", color="black")+geom_smooth(aes_string(x="date",y="Sp"), color="chartreuse", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('KrF' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=KrF),shape=21,fill="yellow1", color="black")+geom_smooth(aes_string(x="date",y="KrF"), color="yellow1", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('MDG' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=MDG),shape=21,fill="greenyellow", color="black")+geom_smooth(aes_string(x="date",y="MDG"), color="greenyellow", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      if('Rødt' %in% input$parti) {p = p+geom_point(data=dat(),size=1, aes(y=Rødt),shape=21,fill="firebrick4", color="black")+geom_smooth(aes_string(x="date",y="Rødt"), color="firebrick4", span = as.numeric(input$span) , level=as.numeric(input$konf))}
      p=p+scale_y_continuous(labels=scales::percent_format(1))
      p=p+labs(title=                 (if(length(input$parti) < 1) {"Velg parti i kontrollpanelet til venstre"} else {paste0("Målinger for ",sub(",([^,]*)$", " og\\1", paste(input$parti,collapse=", ")) )})  ,
               subtitle=paste0("Fra ", 
                               
                               format(input$fra, format="%d. %B %Y")
                               
                               
                               
                               ," til ",
                               
                               
                               format(input$til, format="%d. %B %Y")
                               
                               
                               ),
               x= "Dato",
               y="Oppslutning",
               caption="Visualisering fra mmi.brautaset.fr og data fra PollofPolls.no")
      p=p+theme_bw()+theme(text = element_text(size=16),
                           axis.text.x = element_text(angle=0))
      p
      
      
    }
      
    })
})


