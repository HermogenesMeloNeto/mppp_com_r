### Estatística Descritiva com R
## Tabela de frequência absoluta da variável Type da base facebook
table(facebook$Type)

## Tabela de frequência relativa da variável Type da base facebook
prop.table(table(facebook$Type))

#substituindo NA por zero
facebook$like[which(is.na(facebook$like))] <- 0

## Média da variável like da base facebook
mean(facebook$like)

## Mediana da variável like da base facebook
median(facebook$like)

## Separatrizes da variável facebook$like
quantile(facebook$like, probs=0.75)
quantile(facebook$like, probs=0.10)
quantile(facebook$like, probs=0.95)
boxplot(facebook$like) # boxplot - gráfico que resume as sepatrizes

## Desvio-padrão da variável like da base facebook
sd(facebook$like)

plot(facebook$like)

## Sumário descritivo básico das variáveis
summary(facebook)

## Sumário descritivo completo das variáveis usando o pacote fBasics
pacman::p_load(fBasics)

basicStats(facebook[ , c(8:19)])

hist(facebook$like) # histograma - gráfico que permite conhecer a curva dos dados