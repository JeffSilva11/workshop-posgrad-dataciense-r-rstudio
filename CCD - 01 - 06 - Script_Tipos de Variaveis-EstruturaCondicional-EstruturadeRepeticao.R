#Tipos de Variáveis - Básicas
inteiro = 928
Inteiro = 920
outro.inteiro = 5e2
decimal = 182.93
alfanumerico = "exportação"
logico = TRUE
outro.logico = FALSE
class(inteiro)
class(decimal)
class(alfanumerico)
class(logico)

#Tipos de Variáveis - Complexas
vetor.chr = c("tipo1", "tipo2", "tipo3")
vetor.num = c(1, 2, 5, 8, 10)
vetor.chr
vetor.num
vetor.num.repetidos = c(rep(2, 50))
vetor.num.sequencia = c(seq(from=0, to=100, by=5))
vetor.num.sequencia

nome = c("João", "Maria", "José", "Joana")
idade = c(45, 12, 28, 31)
adulto = c(TRUE, FALSE, TRUE, TRUE)
uf = c("DF", "SP", "RJ", "PR")
clientes = data.frame(nome, idade, adulto, uf)
clientes
clientes$idade


#Estrutura Condicional
x = 0  
variavel = 501  
if (variavel >= 500) {  
  x = 10  
} else {  
  x = 20  
}  
x  

#Estrutura de Repetição
for (i in c(1, 2, 3, 4, 5)) {
  print(i ^ 2)
}

i = 1  
while (i <= 5) {  
  print(i + 10)  
  i = i + 1  
}  









