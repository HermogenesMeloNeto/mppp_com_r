#### CARREGANDO PACOTES ####
pacman::p_load(dplyr, tidyverse)

#### LENDO AS BASES PARA O R ####

# Base salva em bases_originais
IbgeCidadesPE <- read.csv2('bases_originais/IbgeCidadesPE.csv')

# Base salva em bases_originais
Relatorio_DTB_Brasil <- read.csv2('bases_originais/Relatorio_DTB_Brasil_Municipio.csv')

# Junção das bases com todas as linhas da primeira base e da segunda apenas as que possuem chaves iguais as da primeira.
IbgeCidadesPE <- left_join(IbgeCidadesPE, Relatorio_DTB_Brasil, by = c('Código' = 'Código.Município.Completo'))