# amostragem sem reposição usando função sample
# se você não tiver o objeto distNormalSimulacao no seu ambiente, crie com o script anterior
sample(distNormalSimulacao, 30, replace = FALSE) 

# amostragem com reposição usando função sample
sample(distNormalSimulacao, 30, replace = TRUE)

# bootstraping com função replicate
set.seed(412) # agora, não vamos mais usar como tarefa mas como execução ponto a ponto

# replicamos 10x a amostra, criando assim um bootstrapping
bootsDistNormal10 <- replicate(10, sample(distNormalSimulacao, 30, replace = TRUE)) 
bootsDistNormal10

# calculando uma estatística com bootstrapping (30 casos)

# calculamos a média de 10 amostras de 30 casos
mediaBootsNormal10 <- replicate(10, mean(sample(distNormalSimulacao, 30, replace = TRUE))) 

# calculamos a média de 50 amostras de 30 casos
mediaBootsNormal50 <- replicate(50, mean(sample(distNormalSimulacao, 30, replace = TRUE))) 

# calculamos a média de 100 amostras de 30 casos
mediaBootsNormal100 <- replicate(100, mean(sample(distNormalSimulacao, 30, replace = TRUE))) 

# vamos comparar???
mean(mediaBootsNormal10) # media do boostraping 10
mean(mediaBootsNormal50) # media do boostraping 50
mean(mediaBootsNormal100) # media do boostraping 100
mean(distNormalSimulacao) # media dos dados originais

par(mfrow = c(2, 2)) # prepara a área de plotagem para receber 4 plots

hist(distNormalSimulacao, main ="Histograma Simulação Original")
hist(mediaBootsNormal10, main ="Histograma Média 10 Amostras")
hist(mediaBootsNormal50, main ="Histograma Média 50 Amostras")
hist(mediaBootsNormal100, main ="Histograma Média 100 Amostras")

# partições
# caret é um pacote geral de machine learning, se já tiver não innstale
install.packages('caret', dependencies = T) 
library(caret)

# primeiro, criamos as partições de dados

# passamos o tamanho do vetor e o parâmetro de divisão
particaoDistNormal <- createDataPartition(1:length(distNormalSimulacao), p=.8)

# criamos uma partição para treinar os dados, usando a partição anterior. Atenção: o comando unlist é muito usado para transformar uma lista num vetor
treinoDistNormal <- distNormalSimulacao[unlist(particaoDistNormal)]

# criamos uma partição para testar os dados, usando a partição anterior. Atenção: o comando unlist é muito usado para transformar uma lista num vetor
testeDistNormal <- distNormalSimulacao[- unlist(particaoDistNormal)]