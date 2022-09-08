# funções de repetição - família apply
# Uso da mapply com uma customização melhor, gerando títulos personalizados, 
# incluse inserindo no título a palavra "Histograma da"

par(mfrow = c(2, 2)) # prepara a área de plotagem para receber 4 plots

mapply(hist, iris[ , 1:4], main = paste("Histograma da",names(iris)[1:4]), 
                           xlab = "Valores da Variável", 
                           ylab = 'Frequência')
