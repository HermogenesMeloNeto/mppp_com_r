# Instalando os pacotes
pacman::p_load(data.table, dplyr, tidyverse, validate)

# Selecionando as colunas (variáveis)
facebook_tratado <- facebook %>% select(Type, Paid, comment, like)

# Criando as regras da validação
regras_facebook_tratado <- validator(Type != "NA", Paid >= 0, comment >= 0, like >= 0)

# Confrontando as regras da validação
validacao_facebook_tratado <- confront(facebook_tratado, regras_facebook_tratado)

summary(validacao_facebook_tratado)

plot(validacao_facebook_tratado)



### Elimando o erro apresentado na validação anterior e fazer nova validação
facebook_tratado_new <- facebook_tratado %>% filter(Paid>=0)

# Criando as regras da validação
regras_facebook_tratado_new <- validator(Type != "NA", Paid >= 0, comment >= 0, like >= 0)

# Confrontando as regras da validação
validacao_facebook_tratado_new <- confront(facebook_tratado_new, regras_facebook_tratado_new)

summary(validacao_facebook_tratado_new)

plot(validacao_facebook_tratado_new)