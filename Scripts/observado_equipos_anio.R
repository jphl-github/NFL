observado_equipos_anio<- function(team,year){
  library(rvest)
  library(dplyr)
  library(plyr)
  library(tidyverse)
  library(XML)
  library(RCurl)
  library(httr)
  
  #Obteniendo info de internet
    url <- paste0('https://www.pro-football-reference.com/teams/',team,'/',year,'.htm#games::none')
    linkdata <- GET(url)
    data<- readHTMLTable(rawToChar(linkdata$content),stringsAsFactors = FALSE)
  
  #Transformando los datos a data frame y cambiando nombres
    data<-as.data.frame(data$games)
    nombres<-c("Week","Day","Date","Time","Boxscore","Win","OT","Record","Home","Against","Offensive","Defensive","1stD_off","TotY_off","PassY_off","RushY_off","TO_off","1stD_def","TotYd_def","PassY_def","RushY_def","TO_def","Offense_exp","Defense_exp","Special_Teams")
    names(data)<-nombres
    data<-tbl_df(data)
  
  #Win dicotómica
    data$Win[data$Win=="W"]<-1
    data$Win[data$Win=="L"]<-0
  
  #Home Dicotómica
    data$Home[data$Home=="@"]<-0
    data$Home[data$Home==""]<-1
    data$Home[data$Home=="N"]<-0
  
  #Agregando identificador por año
    data$Season<-year

    #Quitando la bye week & línea de Playoffs
    data<-data %>%
      filter(Against != c("Bye Week")) %>% 
      filter(Date != c("Playoffs"))
    
    data<-select(data,-c(Boxscore,OT))
    data$Local<-c(team)
    
  #Guardando el archivo por equipo por año
    directorio<-paste0("~/Documents/R/NFL/NFL/DB/Observado/",team)
    setwd(directorio)
    nombre_archivo<-paste0(year,".csv")
    write.csv(data, file = nombre_archivo)  
}