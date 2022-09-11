# Exercício de Estruturação - Novos Casos por milhão

# Instalando um novo pacote: tidyverse
install.packages('tidyverse')

library(tidyverse)
library(data.table)
library(dplyr)

# carrega dados de covid19 no mundo
general_data <-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") 

# vetor que identifica países latino americanos
latin_america_countries<-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela")

# filtra casos apenas no vetor
latin_america<- general_data %>% filter(location %in% latin_america_countries)

# cria matriz dos países, agrupando por local, criando uma nova linha com index e selecionando apenas algumas variáveis
mlatin <- latin_america %>% group_by(location) %>% mutate(row = row_number()) %>% select(location, new_cases_per_million, row) 

# filtra dados para garantir que todos os países tenham mesmo nro de casos
result <- mlatin %>% group_by(location) %>% filter(row == max(row))
mlatin <- mlatin %>% filter(row<=min(result$row)) 

# pivota o data frame de long para wide
mlatinw <- mlatin %>% pivot_wider(names_from = row, values_from = new_cases_per_million) %>% remove_rownames %>% column_to_rownames(var="location")
