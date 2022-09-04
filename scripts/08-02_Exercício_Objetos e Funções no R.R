# vetor com nome dos filmes  de Exterminador do Futuro
nomeFilme <- c("Exterminador do Futuro", "O Julgamento Final", "A Rebelião das Máquinas", "A Salvação", "Gênesis", "Destino Sombrio")

# vetor com datas de lançamento
lancamentoFilme <- as.Date(c("198-01-01", "1994-01-01", "2003-01-01", "2009-01-01", "2015-01-01", "2019-01-01"))

# vetor com tempo de lançado
tempoLancado <- round( age_calc( lancamentoFilme, units = 'years')) # Tempo de lançamento usando a função age_calc do pacote eeptools e a função round (arredondar)

# data.frame com base nos vetores
listaFilmes <- data.frame(
  nome = nomeFilme,  # Nome 
  Anolancamento = lancamentoFilme, # Ano do lançamento do filme
  TempoLancado = tempoLancado # Tempo de lançado em anos
) 

# estrutura do objeto
str(listaFilmes)

# Instalando o pacote "DT"
install.packages("DT")

# Plotando uma tabela
DT::datatable(listaFilmes[1:6, c(1:3)], rownames = FALSE)  
