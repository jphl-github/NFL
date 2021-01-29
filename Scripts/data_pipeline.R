#Data Pipeline
rm(list=ls())
setwd("~/Documents/R/NFL/NFL")

teams_index <- read.csv("~/Documents/R/NFL/NFL/DB/teams_index.csv")
equipos<-as.character(teams_index$abr)

source("~/Documents/R/NFL/NFL/Scripts/observado_equipos_anio.R")
#sapply(equipos,observado_equipos_anio,year=2020)

source("~/Documents/R/NFL/NFL/Scripts/custom_team_db.R")
            #5,17,2020; 19 errores en dal det(4) gnb(2) htx mia(4) nyg(3) rai(3) sea
            #10,17,2020; 8 errores en det nor nyg(4) pit(2)
            #15,17,2020; 12 errores en chi(3) kan(3) nor(2) nyj(2) phi rav
sapply(equipos,custom_team_db,last_seasons=15,weeks_played=17,year=2020) 

#Hacer BD final