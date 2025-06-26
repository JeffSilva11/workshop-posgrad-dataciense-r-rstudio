#install.packages("dplyr")
library(dplyr)
data(airquality)
airquality
summary(airquality)
is.na(airquality$Ozone)
head(airquality)
complete.cases(airquality) #na = FALSE

getwd()
setwd("D:/WORKSPACES/workspace-vincit/workshop-posgrad-dataciense-r-rstudio/Arquivos")
getwd()
senado = read.csv("senado.csv")
library("dplyr")
senadores.partido = senado %>% select(SenatorUpper, Party)
head(senadores.partido)
senadores2 = senado %>% select(-SenatorUpper, -Party, -Content)
head(senadores2)

senadores.pmdb.rj = senado %>% select(SenatorUpper, Party, State) %>% filter(State == "RJ", Party == "PMDB") %>% distinct()
senadores.pmdb.rj
