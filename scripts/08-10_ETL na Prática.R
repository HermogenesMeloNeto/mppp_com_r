pacman::p_load(dplyr)

prouni2018Ram <- read.csv2('https://dadosabertos.mec.gov.br/images/conteudo/prouni/2018/pda-prouni-2018.csv', sep = ';', encoding = 'UTF-8')
prouni2016Raw <- read.csv2('https://dadosabertos.mec.gov.br/arquivos/prouni/bolsista/pda-prouni-2016.csv', sep = ';', encoding = 'UTF-8')

# junta as bases de dados com comando rbind (juntas por linhas)
colunas_iguais <- names(prouni2018Ram[
  intersect(
    names(prouni2018Ram), names(prouni2016Raw))])

prouni2018Ram <- prouni2018Ram %>% select(all_of(colunas_iguais))

prouni2018_2020Raw <- rbind(prouni2018Ram, prouni2016Raw)

# observa a estrutura dos dados
str(prouni2018_2020Raw)

# modifca a data para formato date
prouni2018_2020Raw$DT_NASCIMENTO_BENEFICIARIO <- as.Date(prouni2018_2020Raw$DT_NASCIMENTO_BENEFICIARIO, format = "%Y-%m-%d")

# modifica a raça do beneficiário de texto para fator
prouni2018_2020Raw$RACA_BENEFICIARIO_BOLSA <- as.factor(prouni2018_2020Raw$RACA_BENEFICIARIO_BOLSA)

# cria função para substituir not available (na) por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}
prouni2018_2020Raw[, 1:15] <- sapply(prouni2018_2020Raw[, 1:15], naZero) # aplica a função naZero a todas as colunas de contagem, porém fiz com todas as colunas já que não possuo colunas de contagem.

# exporta em formato nativo do R
saveRDS(prouni2018_2020Raw, "bases_tratadas/prouni2018_2020.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(prouni2018_2020Raw, "bases_tratadas/prouni2018_2020.csv")
