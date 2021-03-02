#Gráficas
rm(list=ls())
library(tidyverse)
setwd("~/Documents/R/NFL/NFL")

teams_index <- read.csv("~/Documents/R/NFL/NFL/DB/teams_index.csv")
equipos<-as.character(teams_index$abr)

data<- read.csv("~/Documents/R/NFL/NFL/DB/data/last_5_seasons_until_week_17_of_2020.csv")
data_playoffs<- read.csv("~/Documents/R/NFL/NFL/DB/data/playoffs_last_5_seasons_until_week_17_of_2020.csv")

temp<-data %>%
      filter(Local==c("nwe"))


ggplot(temp, aes(x=semana, y=Offensive, fill=factor(Season)))+ geom_line()+ labs(title="Titulo") + ylab("puntos") + xlab("semana")

ggplot(temp, aes(x=factor(semana), y=Offensive, colour=Season,group=Season))+ geom_line()+ labs(title="Titulo") + ylab("puntos") + xlab("semana")
