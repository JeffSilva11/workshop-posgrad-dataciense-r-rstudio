
#install.packages("tidyr")
library(tidyr)
table3
table1
table2

#f(a,b)  ->  a %>% f(b)   (%>% - OPEADOR PIPE)
v = c(1, 2, 3, 4)
sum(v)
v %>% sum
sqrt(sum(v))
v %>% sum %>% sqrt

#A função gather()
table4a
t4a = table4a %>% gather("1999", "2000", key = "year", value = "cases")
t4a

