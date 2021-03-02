#Data Pipeline
rm(list=ls())
setwd("~/Documents/R/NFL/NFL")
teams_index <- read.csv("~/Documents/R/NFL/NFL/DB/teams_index.csv")
equipos<-as.character(teams_index$abr)


source("~/Documents/R/NFL/NFL/Scripts/observado_equipos_anio.R")
#Descarga la información por equipo para el año indicado
#Como resultado, guarda una tabla .csv en la carpeta del equipo con toda la información de la fuente.
  
  #sapply(equipos,observado_equipos_anio,year=2013)


source("~/Documents/R/NFL/NFL/Scripts/custom_team_db.R")
#Genera una base de datos por equipo para las últimas n temporadas y k jornadas, hasta el año indicado.
#Como resultado guarda dos tablas .csv en la carpeta del equipo con toda la información de la fuente y dos variables adicionales
    #5,17,2020; 19 errores en dal det(4) gnb(2) htx mia(4) nyg(3) rai(3) sea
    #10,17,2020; 8 errores en det nor nyg(4) pit(2)
    #15,17,2020; 12 errores en chi(3) kan(3) nor(2) nyj(2) phi rav

  #sapply(equipos,custom_team_db,last_seasons=5,weeks_played=17,year=2020) 

source("~/Documents/R/NFL/NFL/Scripts/custom_db_range.R")
  #custom_db_range(15,17,2020)

#Gráficas 



