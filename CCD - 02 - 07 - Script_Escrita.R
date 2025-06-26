#install.packages("tidyr")
library(tidyr)
table1

#Escrevendo arquivos no formato csv
write.csv(table1, file = "table1.csv", na = "")
getwd()
          
#Escrevendo arquivos no formato RData
participantes = data.frame(
  Nome = c("Carlos", "Maurício", "Ana Maria", "Rebeca", "Patrícia"),
  Estado = c("Tocantins", "Alagoas", "Goiás", "São Paulo", "Ceará"),
  Idade = c(23, 24, 22, 29, 28)
)
save(participantes, file = "participantes.Rdata")
rm(participantes) #removendo o objeto
load("participantes.Rdata")
participantes

#Escrevendo arquivos em Banco de Dados
library(RMySQL)
library(tidyr)
mydb = dbConnect(MySQL(), user="root", password="admin", dbname="aula_7", host="127.0.0.1")
for (i in 1:length(table1$country)) {
  sql = sprintf("insert into Table1 (country, year, cases, population) 
                values ('%s', %d, %d, %d)", 
                table1$country[i], table1$year[i], table1$cases[i], table1$population[i])
  rs = dbSendQuery(mydb, sql)
}
dbClearResult(rs)
dbDisconnect(mydb)
