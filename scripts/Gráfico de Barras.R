#extra - gráfico de barra
dados<- 4:8
barplot(dados)

#adicionando legendas e identificações numerica
names(dados)<-1:5
barplot(dados)

#adicionando legendas e identificações texto
names(dados) <- c("abacate","berinjela","cebola","dados","elefante")
barplot(dados)
