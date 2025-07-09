
library(ggplot2)
data("mtcars")
head(mtcars)
g = ggplot(mtcars)
g = g + geom_point(aes(x = hp, y = mpg, color = factor(am)), size = 3)
g = g + scale_color_manual("Automático", values = c("red", "blue"), labels = c("Sim", "Não"))
g = g + labs(title = "Relação entre consumo, potência e tipo de câmbio", y = "Consumo", x = "Potência")
g

###############################################################
ggplot(iris, aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  geom_point() +
  scale_color_manual(values = c("orange", "black", "red")) +
  scale_x_continuous(name = "Petal Length", breaks = 1:7) +
  scale_y_continuous(name = "Petal Width", breaks = 0:3, limits = c(0, 3))

###############################################################
library(ggplot2)
library(dplyr)
library(gapminder)
library(hrbrthemes)

data("mtcars")
head(gapminder)
dim(gapminder)

#Gráficos de Dispersão
gapminder %>% 
  filter(year == max(year)) %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp)) + 
  geom_point() + 
  labs(title = "Relação entre Renda per Capita e Expectativa de Vida - 2007", x = "Renda per Capita (escala log 10)", y = "Expectativa de Vida")

#Alterando os elementos estáticos, e incluindo uma escala log10
gapminder %>% 
  filter(year == max(year)) %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp, color = continent, shape = continent)) + 
  geom_point(fill = "black", size = 3, stroke = 1) + 
  scale_x_log10() + 
  scale_color_discrete("Continente") + 
  scale_shape_manual("Continente", values = c(19, 21, 22, 23, 24)) + 
  labs(title = "Relação entre Renda per Capita e Expectativa de Vida - 2007", x = "Renda per Capita (escala log 10)", y = "Expectativa de Vida")

#Gráfico de Bolhas
gapminder %>% 
  filter(year == max(year)) %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp, size = pop)) + 
  geom_point() + 
  scale_size_continuous("População (milhões)", labels = function(x) round(x/1e6)) + 
  scale_x_log10() + 
  labs(title = "Relação entre Renda per Capita e Expectativa de Vida - 2007", x = "Renda per Capita (escala log 10)", y = "Expectativa de Vida") + 
  theme_ipsum(plot_title_size = 12, axis_title_size = 10)

#Gráfico de Colunas
gapminder %>% 
  filter(year == max(year), continent == "Americas") %>% 
  ggplot(aes(x = reorder(country, -lifeExp), y = lifeExp)) + 
  geom_col(fill = "dodgerblue") + 
  labs(title = "Expectativa de vida por país", subtitle = "2007", 
       x = "País", y = "Anos") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#Comparando a expectativa de vida de 1957 a 2007 (colunas lado a lado)
gapminder %>% filter(year %in% c(1987, 2007)) %>% 
  #Converte o ano para factor - será categoria no gráfico
  mutate(year = factor(year)) %>%
  group_by(continent, year) %>%
  summarise(lifeExp = mean(lifeExp)) %>%
  ggplot(aes(x = continent, y = lifeExp, fill = year)) + 
  geom_col(position = "dodge") + 
  labs(title = "Expectativa de vida por continente", 
       x = "Continente", 
       y = "Anos", 
       fill = "Ano") + 
  theme_ipsum(plot_title_size = 12, axis_title_size = 10)

#Gráfico de Linhas
gapminder %>% 
  group_by(continent, year) %>% 
  summarise(lifeExp = mean(lifeExp)) %>% 
  ggplot(aes(x = year, y = lifeExp, color = continent)) + 
  geom_line() + 
  labs(title = "Evolução da expectativa de vida por continente", x = "Ano", 
       y = "Anos de vida", color = "Continente") + 
  theme_ipsum(plot_title_size = 12, axis_title_size = 10)

#Gráfico de Linhas com marcadores
gapminder %>% 
  group_by(continent, year) %>% 
  summarise(lifeExp = mean(lifeExp)) %>% 
  ggplot(aes(x = year, y = lifeExp, color = continent)) + 
  geom_line() + 
  geom_point(aes(shape = continent)) + 
  labs(title = "Evolução da expectativa de vida por continente", 
       x = "Ano", y = "Anos de vida", color = "Continente", shape = "Continente") + 
  theme_ipsum(plot_title_size = 12, axis_title_size = 10)

#Histograma
gapminder %>% 
  filter(year == 2007) %>% 
  ggplot(aes(x = lifeExp)) + 
  geom_histogram(binwidth = 5, fill = 'dodgerblue', color = 'black') + 
  labs(title = "Distribuição da expectativa vida", x = "Anos", y = "Contagem") + 
  theme_ipsum(plot_title_size = 12, axis_title_size = 10)

#Gráfico do Tipo Cleveland Dot Plot
gapminder %>% 
  filter(year %in% c(1987, 2007), continent == "Americas") %>% 
  ggplot(aes(x = lifeExp, y = reorder(country, lifeExp, max))) + 
  geom_line(aes(group = country), color = "grey50") + 
  geom_point(aes(color = factor(year))) + 
  labs(title = "Expectativa de vida por país - 1987 e 2007", 
       y = "País", x = "Anos", color = "Ano") + 
  theme_ipsum(plot_title_size = 12, axis_title_size = 10) + 
  theme(panel.grid.major.y = element_line(linetype = "dashed"))
