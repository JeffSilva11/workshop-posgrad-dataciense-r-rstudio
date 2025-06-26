#Lendo de uma Application Programming Interfaces (APIs)
#install.packages("jsonlite")
#install.packages("curl")
library(jsonlite)
library(curl)
hadley = jsonlite::fromJSON("https://api.github.com/users/hadley/repos")
dim(hadley)
head(hadley)



