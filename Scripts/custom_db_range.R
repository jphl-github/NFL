custom_db_range<-function(last_seasons, weeks_played, year){
  library(tidyverse)
  library(dplyr)
  equipos<-as.list(c("crd","atl","rav","buf","car","chi","cin","cle",
                       "dal","den","det","gnb","htx","clt","jax","kan",
                       "sdg","ram","mia","min","nwe","nor","nyg","nyj",
                       "rai","phi","pit","sfo","sea","tam","oti","was"))
  directorio<-paste0("~/Documents/R/NFL/NFL/DB/Observado/")
  
  lista_directorio<-paste0(directorio,equipos,"/","bd_last_",last_seasons,"_seasons_","until_week_",weeks_played,"_of_",year,".csv")
  lista_data<-lapply(lista_directorio, read.csv)
  temp<-do.call("rbind", lista_data)
  temp$etiqueta<-(paste0(temp$Home,"/",temp$Local,"/",temp$Season,"-J",temp$Week,"/",temp$Day,"-",temp$Date,"/",temp$Against,"/",temp$Defensive))
  final_db<-select(temp,c(Local,Offensive, Defensive, Season,semana,Season_Week,Season_Week_num,etiqueta))
  
  lista_directorio_playoffs<-paste0(directorio,equipos,"/","bd_playoffs_last_",last_seasons,"_seasons_","until_week_",weeks_played,"_of_",year,".csv")
  lista_data_playoffs<-lapply(lista_directorio_playoffs, read.csv)
  temp<-do.call("rbind", lista_data_playoffs)
  temp$etiqueta<-(paste0(temp$Home,"/",temp$Local,"/",temp$Season,"-J",temp$Week,"/",temp$Day,"-",temp$Date,"/",temp$Against,"/",temp$Defensive))
  final_db_playoffs<-select(temp,c(Local,Offensive, Defensive, Season,semana,Season_Week,Season_Week_num,etiqueta))
  
  directorio<-paste0("~/Documents/R/NFL/NFL/DB/data/")
  setwd(directorio)
  nombre_archivo<-paste0("last_",last_seasons,"_seasons_","until_week_",weeks_played,"_of_",year,".csv")
  write.csv(final_db, file = nombre_archivo)  
  nombre_archivo_p<-paste0("playoffs_last_",last_seasons,"_seasons_","until_week_",weeks_played,"_of_",year,".csv")
  write.csv(final_db_playoffs, file = nombre_archivo_p)  
}