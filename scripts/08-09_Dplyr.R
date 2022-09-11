# Exercício Dplyr
library(dplyr)

# Lendo dados disponíveis na internet e armazenando em um dataframe
facebook <- read.table("https://raw.githubusercontent.com/hugoavmedeiros/cd_com_r/master/bases_originais/dataset_Facebook.csv", sep=";", header = T)

### Sumários e Agrupamento

# sumários
count(facebook, Category) 

# sumários com agrupamentos: Média de comentários por tipo
facebook %>% group_by(Type) %>% summarise(avg = mean(comment))

### Transformação de Casos

# seleção de casos
facebook %>%  filter(Type != "Link") %>% summarise(avg = mean(comment))
facebook %>%  filter(Type != "Link") %>% group_by(Type, Category) %>% summarise(avg.comment = mean(comment))

# ordenar casos
arrange(facebook, comment) # ascendente
arrange(facebook, desc(comment)) # descendente

### Transformação de Variáveis

# seleção de colunas
facebook %>% select(comment, Type, like, Paid, Category) %>% arrange(comment)

# novas colunas
facebook %>% mutate(commentPerLifeTime = comment/Lifetime.Post.Total.Reach)

# renomear
facebook %>% rename(People.liked.Page.engaged = Lifetime.People.who.have.liked.your.Page.and.engaged.with.your.post)