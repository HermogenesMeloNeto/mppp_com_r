# Index e Operadores Lógicos

# Recuperando objeto criado anteriormente e extraindo parte dos dados com indexação
print(listaIDEB[1:7, c(1, 2, 4)])

# Plotando uma tabela com todos os dados
DT::datatable(listaIDEB[1:7, c(1:4)], rownames = FALSE) # Já havia instalado o pacote "DT" em atividade anterior

# Plotando uma tabela com parte dos dados, usando indexação
DT::datatable(listaIDEB[1:7, c(1, 2, 4)], rownames = FALSE)
