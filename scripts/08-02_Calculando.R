# o R como calculadora

# Criando uma distribuição geométrica
geometricaSimulacao <- rgeom(300, 0.5) # 300 observações com 50% de probabilidade

# Apresentando a distribuição geométrica criada
print(geometricaSimulacao) 

# Gerando o histograma
hist(geometricaSimulacao)

# Centralizando com a função rev (inverte o vetor)
geometricaSimulacaoCentral <- geometricaSimulacao - rev(geometricaSimulacao)
hist(geometricaSimulacaoCentral)
