# Exercício de Leitura da base extraída anteriormente

# Instalando o pacote microbenchmark
pacman::p_load(microbenchmark)
library(microbenchmark)

# exporta em formato nativo do R
saveRDS(prouni2018_2020Raw, "bases_tratadas/prouni2018_2020.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(prouni2018_2020Raw, "bases_tratadas/prouni2018_2020.csv")

# carrega base de dados em formato nativo R
prouni2018_2020 <- readRDS('bases_tratadas/prouni2018_2020.rds')

# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade
prouni2018_2020 <- read.csv2('bases_tratadas/prouni2018_2020.csv', sep = ';')

# compara os dois processos de exportação, usando a função microbenchmark
microbenchmark(a <- saveRDS(prouni2018_2020Raw, "bases_tratadas/prouni2018_2020.rds"), b <- write.csv2(prouni2018_2020Raw, "bases_tratadas/prouni2018_2020.csv"), times = 10L)
microbenchmark(a <- readRDS('bases_tratadas/prouni2018_2020.rds'), b <- read.csv2('bases_tratadas/prouni2018_2020.csv', sep = ';'), times = 10L)
