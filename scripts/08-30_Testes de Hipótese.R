## Testes de Hipótese ##

## CORRELAÇÃO COM R ##
# PRIMEIRO, VAMOS CARREGAR OS PACOTES
pacman::p_load(corrplot, dplyr, ggplot2)

# BASE DE DADOS USArrests #
# CORRELAÇÃO ENTRE AS VARIÁVEIS "MURDER" E "ASSAULT"#
cor.test(USArrests$Murder, USArrests$Assault) # H1: variáveis são dependentes / há associação. p-valor (p-value) <= 0.05

# TABELA DE CORRELAÇÃO COM TODAS AS VARIÁVEIS #
cor(USArrests)

# GRÁFICOS DE DISPERSÃO PAREADOS DAS VARIÁVEIS #
pairs(USArrests)

# CORRPLOT DAS VARIÁVEIS #
USArrestsCor <- cor(USArrests)
par(mfrow = c(1, 2)) # prepara a área de plotagem para receber 2 plots
corrplot(USArrestsCor, method = "number", order = 'alphabet')
corrplot(USArrestsCor, order = 'alphabet')

t.test(USArrests$Murder, mu = 7.5)
t.test(USArrests$Assault, mu = 170)
shapiro.test(USArrests$Murder)
shapiro.test(USArrests$Assault)

mapply(hist, USArrests[ , 1:2], main = paste("Histograma da",names(USArrests)[1:2]), 
       xlab = "Valores da Variável", 
       ylab = 'Frequência')
