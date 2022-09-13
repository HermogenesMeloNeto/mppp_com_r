## CORRELAÇÃO COM R ##
# PRIMEIRO, VAMOS CARREGAR OS PACOTES
pacman::p_load(corrplot, dplyr, ggplot2)

# BASE DE DADOS IRIS SEM AS ESPÉCIES #
facebook2 <- facebook %>% select(Lifetime.Post.Total.Reach:like)

# Vamos retirar as linhas que contenham valores NA com a função na.omit
facebook2_na <- na.omit(facebook2)

# TABELA DE CORRELAÇÃO COM TODAS AS VARIÁVEIS #
cor(facebook2_na)

# GRÁFICOS DE DISPERSÃO PAREADOS DAS VARIÁVEIS #
pairs(facebook2_na)