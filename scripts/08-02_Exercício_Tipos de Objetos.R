# Instalando um novo pacote: eeptools
install.packages('eeptools')

# Chamando o pacote
library(eeptools)

# vetor IDEB Brasil - Observado - Ensino Fundamental I - 2007-2019
ObservadoIDEB <- c(4.2, 4.6, 5.0, 5.2, 5.5, 5.8, 5.9)

# vetor IDEB Brasil - Metas - Ensino Fundamental I - 2007-2019
MetaIDEB <- c(3.9, 4.2, 4.6, 4.9, 5.2, 5.5, 5.7)

# vetor IDEB Brasil (Obsevado-Metas) - Ensino Fundamental I - 2007-2019
AnaliseMetaIDEB <- ObservadoIDEB - MetaIDEB

# vetor IDEB Brasil (Atingiu/NãoAtingiu) - Ensino Fundamental I - 2007-2019
Atingiu_ou_NaoAtingiu <- function(AnaliseMetaIDEB){
ifelse(AnaliseMetaIDEB >= 0, "Atingiu", "Não Atingiu")
}

# vetor Ano do IDEB
AnoIDEB <- c(2007, 2009, 2011, 2013, 2015, 2017, 2019)

# data.frame com base nos vetores
listaIDEB <- data.frame(
  Ano = AnoIDEB,  # Ano do IDEB 
  IDEB = ObservadoIDEB, # IDEB observado
  Meta = MetaIDEB, # Meta prevista
  Situacao = Atingiu_ou_NaoAtingiu(AnaliseMetaIDEB)
) 

# estrutura do objeto
str(listaIDEB)

# Instalando o pacote "DT"
install.packages("DT")

# Plotando uma tabela
DT::datatable(listaIDEB[1:7, c(1:4)], rownames = FALSE) 
