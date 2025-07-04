#install.packages("tidyr")
library(tidyr)
table2

#A fun��o  spread() - junta dados em menos linhas
table2.wide = spread(table2, key = type, value = count)
table2.wide

#A fun��o separate() - separar dados de uma coluna e mais de uma coluna
table3
table3.wide = table3 %>% separate(rate, into = c("cases", "population"), sep = "/")
table3.wide

#A fun��o unite() - unifica dados de colunas em uma coluna
table5
table5.wide = table5 %>% unite(new, century, year, sep = "")
table5.wide
