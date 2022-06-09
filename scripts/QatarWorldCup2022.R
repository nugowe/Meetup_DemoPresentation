Rpackages=c("polite","rvest","kableExtra","gt")

for (i in Rpackages){install.packages(i)}


library(polite)
library(tidyverse)
library(rvest)
library(kableExtra)



url <- "https://en.wikipedia.org/wiki/2022_FIFA_World_Cup"

session = bow(user_agent = "FIFAWCQ-Table-Scrape", url)


GROUPA <- scrape(session) %>% html_nodes("table.wikitable:nth-child(68) > tbody:nth-child(1)") %>% html_table()
GROUPB <- scrape(session) %>% html_nodes("table.wikitable:nth-child(88) > tbody:nth-child(1)") %>% html_table()
GROUPC <- scrape(session) %>% html_nodes("table.wikitable:nth-child(108) > tbody:nth-child(1)") %>% html_table()
GROUPD <- scrape(session) %>% html_nodes("table.wikitable:nth-child(128) > tbody:nth-child(1)") %>% html_table()
GROUPE <- scrape(session) %>% html_nodes("table.wikitable:nth-child(148) > tbody:nth-child(1)") %>% html_table()
GROUPF <- scrape(session) %>% html_nodes("table.wikitable:nth-child(168) > tbody:nth-child(1)") %>% html_table()
GROUPG <- scrape(session) %>% html_nodes("table.wikitable:nth-child(188) > tbody:nth-child(1)") %>% html_table()
GROUPH <- scrape(session) %>% html_nodes("table.wikitable:nth-child(208) > tbody:nth-child(1)") %>% html_table()
WebscrapeTime <- format(Sys.time(), "%A %B %Y, %H:%M:%S (CST)")



GROUPS <- function(GROUP){
    
GROUP <- as.data.frame(GROUP)
  
names(GROUP)[2]<-"Team"
  
names(GROUP)[1]<-"Ranking"
  
GROUP$Flags <- ""
  
GROUP <- GROUP[,c(1,12,2:11)]
  

  
}





GROUPA <- GROUPS(GROUPA)
GROUPB <- GROUPS(GROUPB)
GROUPC <- GROUPS(GROUPC)
GROUPD <- GROUPS(GROUPD)
GROUPE <- GROUPS(GROUPE)
GROUPF <- GROUPS(GROUPF)
GROUPG <- GROUPS(GROUPG)
GROUPH <- GROUPS(GROUPH)

#TEAMFLAGS

#GROUPA
QatarFlag <- "https://cdn.countryflags.com/thumbs/qatar/flag-400.png"
EcuadorFlag <- "https://upload.wikimedia.org/wikipedia/commons/e/e8/Flag_of_Ecuador.svg"
SenegalFlag <- "https://upload.wikimedia.org/wikipedia/commons/f/fd/Flag_of_Senegal.svg"
NetherlandsFlag <- "https://upload.wikimedia.org/wikipedia/commons/2/20/Flag_of_the_Netherlands.svg"  

#GROUPB
EnglandFlag <- 'https://upload.wikimedia.org/wikipedia/en/b/be/Flag_of_England.svg'
UEFAAFlag <- 'https://upload.wikimedia.org/wikipedia/commons/9/9e/600px_Grey_HEX-DADADA_with_White_question_mark.svg'
IranFlag <- 'https://upload.wikimedia.org/wikipedia/commons/c/ca/Flag_of_Iran.svg'
USAFlag <- 'https://upload.wikimedia.org/wikipedia/commons/e/e2/Flag_of_the_United_States_%28Pantone%29.svg'

#GROUPC
ArgentinaFlag <- 'https://upload.wikimedia.org/wikipedia/commons/1/1a/Flag_of_Argentina.svg'
SaudiArabiaFlag <- 'https://upload.wikimedia.org/wikipedia/commons/0/0d/Flag_of_Saudi_Arabia.svg'
MexicoFlag <- 'https://upload.wikimedia.org/wikipedia/commons/f/fc/Flag_of_Mexico.svg'
PolandFlag <- 'https://upload.wikimedia.org/wikipedia/en/1/12/Flag_of_Poland.svg'

#GROUPD
FranceFlag <- 'https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg'
AFCConmobolwinnersFlag <- 'https://upload.wikimedia.org/wikipedia/commons/9/9e/600px_Grey_HEX-DADADA_with_White_question_mark.svg'
DenmarkFlag <- 'https://upload.wikimedia.org/wikipedia/commons/9/9c/Flag_of_Denmark.svg'
TunisiaFlag <- 'https://upload.wikimedia.org/wikipedia/commons/c/ce/Flag_of_Tunisia.svg'

#GROUPE
SpainFlag <- 'https://upload.wikimedia.org/wikipedia/commons/8/89/Bandera_de_Espa%C3%B1a.svg'
CONCACAFOFCFlag <- 'https://upload.wikimedia.org/wikipedia/commons/9/9e/600px_Grey_HEX-DADADA_with_White_question_mark.svg'
GermanyFlag <- 'https://upload.wikimedia.org/wikipedia/en/b/ba/Flag_of_Germany.svg'
JapanFlag <- 'https://upload.wikimedia.org/wikipedia/en/9/9e/Flag_of_Japan.svg'

#GROUPF
BelgiumFlag <- 'https://upload.wikimedia.org/wikipedia/commons/6/65/Flag_of_Belgium.svg'
CanadaFlag <- 'https://upload.wikimedia.org/wikipedia/commons/d/d9/Flag_of_Canada_%28Pantone%29.svg'
MoroccoFlag <- 'https://upload.wikimedia.org/wikipedia/commons/2/2c/Flag_of_Morocco.svg'
CroatiaFlag <- 'https://upload.wikimedia.org/wikipedia/commons/1/1b/Flag_of_Croatia.svg'

#GROUPG
BrazilFlag <- 'https://upload.wikimedia.org/wikipedia/en/0/05/Flag_of_Brazil.svg'
SerbiaFlag <- 'https://upload.wikimedia.org/wikipedia/commons/f/ff/Flag_of_Serbia.svg'
SwitzerlandFlag <- 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Flag_of_Switzerland.svg'
CameroonFlag <- 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Flag_of_Cameroon.svg'

#GROUPH
PortugalFlag <- 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_Portugal.svg'
GhanaFlag <- 'https://upload.wikimedia.org/wikipedia/commons/1/19/Flag_of_Ghana.svg'
UruguayFlag <- 'https://upload.wikimedia.org/wikipedia/commons/f/fe/Flag_of_Uruguay.svg'
SouthKoreaFlag <- 'https://upload.wikimedia.org/wikipedia/commons/0/09/Flag_of_South_Korea.svg'


TeamFlags <- c(QatarFlag, EcuadorFlag, SenegalFlag, NetherlandsFlag,EnglandFlag, IranFlag, USAFlag, UEFAAFlag,ArgentinaFlag, SaudiArabiaFlag, MexicoFlag, PolandFlag,FranceFlag, AFCConmobolwinnersFlag, DenmarkFlag, TunisiaFlag,SpainFlag, CONCACAFOFCFlag, GermanyFlag, JapanFlag,BelgiumFlag, CanadaFlag, MoroccoFlag, CroatiaFlag,BrazilFlag,SerbiaFlag,SwitzerlandFlag,CameroonFlag,PortugalFlag,GhanaFlag,UruguayFlag,SouthKoreaFlag)

TeamGroups <- rbind(GROUPA,GROUPB,GROUPC,GROUPD,GROUPE,GROUPF,GROUPG,GROUPH)

TeamFlagsListA <- list()
TeamFlagsListB <- list()
TeamFlagsListC <- list()
TeamFlagsListD <- list()
TeamFlagsListE <- list()
TeamFlagsListF <- list()
TeamFlagsListG <- list()
TeamFlagsListH <- list()

for (i in 1:4){
for(Team in GROUPA$Team[i]){
  if(Team =='Qatar (H)'){
    TeamFlagsListA <- append(TeamFlagsListA, TeamFlags[1] )
  }else if(Team == 'Ecuador'){
    TeamFlagsListA <- append(TeamFlagsListA, TeamFlags[2] )
  }else if(Team == 'Senegal'){
    TeamFlagsListA <- append(TeamFlagsListA, TeamFlags[3] )
  }else if(Team == 'Netherlands'){
    TeamFlagsListA <- append(TeamFlagsListA, TeamFlags[4] )
  }
}
}
  
  
for (i in 1:4){
  for(TeamB in GROUPB$Team[i]){
  if(TeamB == 'England'){
    TeamFlagsListB <- append(TeamFlagsListB, TeamFlags[5] )
  }else if(TeamB == 'Iran'){
    TeamFlagsListB <- append(TeamFlagsListB, TeamFlags[6] )
  }else if(TeamB == 'United States'){
    TeamFlagsListB <- append(TeamFlagsListB, TeamFlags[7] )
  }else if(TeamB == 'UEFA Path A winners'){
    TeamFlagsListB <- append(TeamFlagsListB, TeamFlags[8] )
  }
  }}  
    


for (i in 1:4){
  for(TeamC in GROUPC$Team[i]){
  if(TeamC == 'Argentina'){
    TeamFlagsListC <- append(TeamFlagsListC, TeamFlags[9] )
  }else if(TeamC == 'Saudi Arabia'){
    TeamFlagsListC <- append(TeamFlagsListC, TeamFlags[10] )
  }else if(TeamC == 'Mexico'){
    TeamFlagsListC <- append(TeamFlagsListC, TeamFlags[11] )
  }else if(TeamC == 'Poland'){
    TeamFlagsListC <- append(TeamFlagsListC, TeamFlags[12] )
  }
}}




for (i in 1:4){
for(TeamD in GROUPD$Team[i]){
if(TeamD == 'France'){
    TeamFlagsListD <- append(TeamFlagsListD, TeamFlags[13] )
  }else if(TeamD == 'AFC–CONMEBOL winners'){
    TeamFlagsListD <- append(TeamFlagsListD, TeamFlags[14] )
  }else if(TeamD == 'Denmark'){
    TeamFlagsListD <- append(TeamFlagsListD, TeamFlags[15] )
  }else if(TeamD == 'Tunisia'){
    TeamFlagsListD <- append(TeamFlagsListD, TeamFlags[16] )
  }
}}



for (i in 1:4){
for(TeamE in GROUPE$Team[i]){  
if(TeamE == 'Spain'){
    TeamFlagsListE <- append(TeamFlagsListE, TeamFlags[17] )
  }else if(TeamE == 'CONCACAF–OFC winners'){
    TeamFlagsListE <- append(TeamFlagsListE, TeamFlags[18] )
  }else if(TeamE == 'Germany'){
    TeamFlagsListE <- append(TeamFlagsListE, TeamFlags[19] )
  }else if(TeamE == 'Japan'){
    TeamFlagsListE <- append(TeamFlagsListE, TeamFlags[20] )
  }
}}
  
  
for (i in 1:4){
  for(TeamF in GROUPF$Team[i]){    
if(TeamF == 'Belgium'){
    TeamFlagsListF <- append(TeamFlagsListF, TeamFlags[21] )
  }else if(TeamF == 'Canada'){
    TeamFlagsListF <- append(TeamFlagsListF, TeamFlags[22] )
  }else if(TeamF == 'Morocco'){
    TeamFlagsListF <- append(TeamFlagsListF, TeamFlags[23] )
  }else if(TeamF == 'Croatia'){
    TeamFlagsListF <- append(TeamFlagsListF, TeamFlags[24] )
  }
  }}  
    
 
for (i in 1:4){
  for(TeamG in GROUPG$Team[i]){     
  if(TeamG == 'Brazil'){
    TeamFlagsListG <- append(TeamFlagsListG, TeamFlags[25] )
  }else if(TeamG == 'Serbia'){
    TeamFlagsListG <- append(TeamFlagsListG, TeamFlags[26] )
  }else if(TeamG == 'Switzerland'){
    TeamFlagsListG <- append(TeamFlagsListG, TeamFlags[27] )
  }else if(TeamG == 'Cameroon'){
    TeamFlagsListG <- append(TeamFlagsListG, TeamFlags[28] )
  }
  }}   
    
    

for (i in 1:4){
  for(TeamH in GROUPH$Team[i]){  
  if(TeamH == 'Portugal'){
    TeamFlagsListH <- append(TeamFlagsListH, TeamFlags[29] )
  }else if(TeamH == 'Ghana'){
    TeamFlagsListH <- append(TeamFlagsListH, TeamFlags[30] )
  }else if(TeamH == 'Uruguay'){
    TeamFlagsListH <- append(TeamFlagsListH, TeamFlags[31] )
  }else if(TeamH == 'South Korea'){
    TeamFlagsListH <- append(TeamFlagsListH, TeamFlags[32] )
  }
  
}
}

TeamFlagsListFinal <- c(TeamFlagsListA,TeamFlagsListB, TeamFlagsListC, TeamFlagsListD, TeamFlagsListE, TeamFlagsListF, TeamFlagsListG, TeamFlagsListH )

TeamGroups %>%
  kbl(booktabs = T, caption = "<style> img{display: block; margin-left: auto; margin-right: auto; } </style>  <img src='https://cloudinary.fifa.com/api/v1/picture/tournaments-sq-4/255711?tx=c_fill' style='height:240px;'> ") %>%
  kable_paper(full_width = F) %>%
  column_spec(2, image = spec_image(
    c(TeamFlagsListFinal), 150, 100)) %>% kable_classic(full_width = F, html_font = "Lato") %>% pack_rows("Group A", 1, 4, label_row_css = "background-color: #666; color: #fff;") %>% 
  pack_rows("Group B", 5, 8, label_row_css = "background-color: #666; color: #fff;") %>% 
  pack_rows("Group C", 9, 12, label_row_css = "background-color: #666; color: #fff;") %>% 
  pack_rows("Group D", 13, 16, label_row_css = "background-color: #666; color: #fff;") %>% 
  pack_rows("Group E", 17, 20, label_row_css = "background-color: #666; color: #fff;") %>% 
  pack_rows("Group F", 21, 24, label_row_css = "background-color: #666; color: #fff;") %>% 
  pack_rows("Group G", 25, 28, label_row_css = "background-color: #666; color: #fff;") %>% 
  pack_rows("Group H", 29, 32, label_row_css = "background-color: #666; color: #fff;") %>% 
  row_spec(1:2, bold = T, background = "#CED2CC") %>% 
  row_spec(5:6, bold = T, background = "#CED2CC") %>% 
  row_spec(9:10, bold = T, background = "#CED2CC") %>% 
  row_spec(13:14, bold = T, background = "#CED2CC") %>% 
  row_spec(17:18, bold = T, background = "#CED2CC") %>% 
  row_spec(21:22, bold = T, background = "#CED2CC") %>% 
  row_spec(25:26, bold = T, background = "#CED2CC") %>% 
  row_spec(29:30, bold = T, background = "#CED2CC") %>% 
   row_spec(3:4, bold = T, background = "#CED2CC") %>% 
  row_spec(7:8, bold = T, background = "#CED2CC") %>% 
  row_spec(9:10, bold = T, background = "#CED2CC") %>% 
  row_spec(11:12, bold = T, background = "#CED2CC") %>% 
  row_spec(13:14, bold = T, background = "#CED2CC") %>% 
  row_spec(15:18, bold = T, background = "#CED2CC") %>% 
  row_spec(19:20, bold = T, background = "#CED2CC") %>% 
  row_spec(21:22, bold = T, background = "#CED2CC") %>% 
  row_spec(23:24, bold = T, background = "#CED2CC") %>% 
  row_spec(25:26, bold = T, background = "#CED2CC") %>% 
  row_spec(27:28, bold = T, background = "#CED2CC") %>% 
  row_spec(29:30, bold = T, background = "#CED2CC") %>% 
  row_spec(31:32, bold = T, background = "#CED2CC") %>% 
  column_spec(4, background = "#AC3E31") %>% 
  column_spec(6, background = "#7E909A") %>% 
  column_spec(5, background = "#DBAE58") %>%             
  column_spec(7, background = "#A5D8DD") %>% 
  column_spec(8, background = "#1C4E80") %>% 
  column_spec(9, background = "#488A99") %>% 
  column_spec(10, background = "#A5D8DD") %>% 
  column_spec(11, background = "#488A99") %>% 
  
  footnote(general = "(H) represents the Hosting Nation. ", "Data Sources are from Wikipedia.com and FIFA.com && Edit made live from our Meetup!!!!", sprintf("Last successful Webscrape time was %s", WebscrapeTime )) %>% save_kable(file = "Qatar2022Groups.html", self_contained = T) 
  
 
  
             
