
getwd()
setwd("D:\WORKSPACES\workspace-vincit\workshop-posgrad-dataciense-r-rstudio\Arquivos")
getwd()

#install.packages("devtools", version = "3.4")
#Sys.which("make")
#devtools::install_version("tidyverse", version = "1.2.1")
install.packages("tidyverse")
library(tidyverse)

#IMPORTAR arquivo separado por virgula
senado = read_csv("senado.csv")
head(senado)
tail(senado)
class(senado)
summary(senado)
str(senado)

#IMPORTAR arquivo separado por "|"
med = read_delim("TA_PRECOS_MEDICAMENTOS.csv", delim = "|")
head(med)
tail(med)

#IMPORTAR arquivo de colunas fixas
data1 = read_fwf
data1 = read_fwf("fwf-sample.txt", col_positions = fwf_widths(c(20, 10, 12), c("None", "Estado", "Código")))
head(data1)


#IMPORTAR de BD MYSQL
install.packages("RMySQL")
library(RMySQL)
mydb = dbConnect(MySQL(), user="root", password="admin", dbname="reddit", host="127.0.0.1")
dbListTables(mydb)
dbListFields(mydb, "users")

pointer = dbSendQuery(mydb, "select id, Label, Degree, closnesscentrality, betweenesccentrality from users where id >= 7000")
users = fetch(pointer, 6)
head(users)
dbDisconnect(mydb)

