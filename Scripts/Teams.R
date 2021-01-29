#Team Names and Division
rm(list=ls())

equipos<-as.tibble(c("crd","atl","rav","buf","car","chi","cin","cle",
                   "dal","den","det","gnb","htx","clt","jax","kan",
                   "sdg","ram","mia","min","nwe","nor","nyg","nyj",
                   "rai","phi","pit","sfo","sea","tam","oti","was"))

teams<-as.tibble(c("Arizona Cardinals","Atlanta Falcons","Baltimore Ravens","Buffalo Bills","Carolina Panthers","Chicago Bears","Cincinnati Bengals","Cleveland Browns",
                 "Dallas Cowboys","Denver Broncos","Detroit Lions","Green Bay Packers","Houston Texans","Indianapolis Colts","Jacksonville Jaguars","Kansas City Chiefs",
                 "Los Angeles Chargers","Los Angeles Rams","Miami Dolphins","Minnesota Vikings","New England Patriots","New Orleans Saints","New York Giants","New York Jets",
                 "Las Vegas Raiders","Philadelphia Eagles","Pittsburgh Steelers","San Francisco 49ers","Seattle Seahawks","Tampa Bay Buccaneers","Tennessee Titans","Washington Football Team"))

nicknames<-as.tibble(c("Cardinals","Falcons","Ravens","Bills","Panthers","Bears","Bengals","Browns",
                     "Cowboys","Broncos","Lions","Packers","Texans","Colts","Jaguars","Chiefs",
                     "Chargers","Rams","Dolphins","Vikings","Patriots","Saints","Giants","Jets",
                     "Raiders","Eagles","Steelers","49ers","Seahawks","Buccaneers","Titans","Washington"))

league<-as.tibble(c("nfc","nfc","afc","afc","nfc","nfc","afc","afc",
                  "nfc","afc","nfc","nfc","afc","afc","afc","afc",
                  "afc","nfc","afc","nfc","afc","nfc","nfc","afc",
                  "afc","nfc","afc","nfc","nfc","nfc","afc","nfc"))

division<-as.tibble(c("west","south","north","east","south","north","north","north",
                    "east","west","north","north","south","south","south","west",
                    "west","west","east","north","east","south","east","east",
                    "west","east","north","west","west","south","south","east"))

teams<-bind_cols(equipos,teams,nicknames,division,league)
names(teams)<-c("abr","team_name","nickname","division","league")

teams$abr<-as.factor(teams$abr)
teams$team_name<-as.factor(teams$team_name)
teams$nickname<-as.factor(teams$nickname)
teams$division<-as.factor(teams$division)
teams$league<-as.factor(teams$league)

directorio<-paste0("~/Documents/R/NFL/NFL/DB")
setwd(directorio)
nombre_archivo<-paste0("teams_index.csv")
write.csv(teams, file = nombre_archivo)
