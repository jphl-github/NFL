custom_team_db<-function(team, last_seasons, weeks_played, year){
  library(dplyr)
  library(plyr)
  library(tidyverse)
  
  #Estableciendo directorio
  directorio<-paste0("~/Documents/R/NFL/NFL/DB/Observado/",team)
  setwd(directorio)
  
  #Generando lista de últimas x temporadas
  years<-as.list(c((year-last_seasons+1):year))
  
  archivo<-paste0(directorio,"/",years,".csv")
  season_list<-lapply(archivo, read.csv)
  
  #Juntando toda la info en un data frame
  consolidado<-rbind.data.frame(season_list[[1]],season_list[[2]])
  total_years<-c(3:length(years))
  for(n in total_years) {
    consolidado<- rbind.data.frame(consolidado,season_list[[n]])
  }
  consolidado$Season_Week<-paste0(consolidado$Season,"_",consolidado$Week)
  consolidado$Season_Week_num<-paste0(consolidado$Season,".",sprintf("%02d",consolidado$X))
  consolidado$semana<-paste0(sprintf("%02d",consolidado$X))

  #Base de datos con playoffs
  bd_playoffs<-consolidado
  bd_playoffs$X<-c(1:length(bd_playoffs$X))
  bd_playoffs<-as_tibble(bd_playoffs)
  n<-length(bd_playoffs$X)-17+weeks_played
  bd_playoffs<-head(bd_playoffs,n=n)
  nombre_archivo<-paste0("bd_playoffs_last_",last_seasons,"_seasons_","until_week_",weeks_played,"_of_",year,".csv")
  write.csv(bd_playoffs, file = nombre_archivo) 
  
  #Base de datos sin playoffs
  bd<-consolidado
  bd$Week<-as.character(bd$Week)
  bd$Week<-as.integer(bd$Week)
  bd<-bd %>% filter(X <= 16)
  bd$X<-c(1:length(bd$X))
  bd<-as_tibble(bd)
  n<-length(bd$X)-17+weeks_played
  bd<-head(bd,n=n)
  nombre_archivo<-paste0("bd_last_",last_seasons,"_seasons_","until_week_",weeks_played,"_of_",year,".csv")
  write.csv(bd, file = nombre_archivo)
}
