# Exercício de Limpeza: Remoção dos NA 

# Instalando um novo pacote: tidyverse
install.packages('funModeling')

library(data.table)
library(dplyr)
library(tidyverse)
library(funModeling) 

# carrega dados de covid19 no mundo
general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv")

# vetor que identifica países latino americanos
latin_america_countries <-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela")

# filtra casos apenas no vetor
latin_america <- general_data %>% filter(location %in% latin_america_countries)
latin_america <- latin_america %>% select(location, new_cases, new_deaths)

status(latin_america) # estrutura dos dados (missing etc)
freq(latin_america) # frequência das variáveis fator
plot_num(latin_america) # exploração das variáveis numéricas
profiling_num(latin_america) # estatísticas das variáveis numéricas

latin_america %>% filter(new_cases < 0)

# Ao Remover os negativos também remove os NA, visto que se selecionou apenas >=0
latin_america <- latin_america %>% filter(new_cases>=0, new_deaths>=0)
# Remove todas as linhas com N/A (not available)
latin_america <- latin_america %>% filter(new_cases!="N/A", new_deaths!="N/A")
