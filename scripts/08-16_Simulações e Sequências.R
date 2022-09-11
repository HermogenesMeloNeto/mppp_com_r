# seta a semente aleatória de geração de dados
# usando a função addTaskCallback deixamos a set.seed fixa, rodando no back

# atribui a tarefa à variável tarefaSemente
tarefaSemente <- addTaskCallback(function(...) {set.seed(123);TRUE}) 

# chama a tarefaSemente
tarefaSemente

# distribuição normal simulada
# usa a função rnorm para criar uma distribuição normal, indicando o total de casos
distNormalSimulacao <- rnorm(100, mean = 0.1, sd = 1.2)

# Histograma da distNormalSimulacao
hist(distNormalSimulacao, main="Histograma Distribuição Normal")

# sumário da distNormalSimulacao
summary(distNormalSimulacao) 

# distribuição binomial simulada
# rbinom para criar distribuição binominal, indicando casos, tamanho e probabilidade
distBinominalSimulacao <- rbinom(100, 1, 0.3)

# repetições
# vetor repetindo a classe Feminino e Masculino 50% cada
classeSimulacao <- c(rep("Feminino", length(distBinominalSimulacao)/2), rep("Masculino", length(distBinominalSimulacao)/2)) 

# sequências
# vetor com índex dos dados, usando a função length para pegar o total de casos
indexSimulacao <- seq(1, length(distNormalSimulacao)) 

# por fim, podemos usar a função removeTaskCallback para remover a tarefa que criamos lá em cima
removeTaskCallback(tarefaSemente)