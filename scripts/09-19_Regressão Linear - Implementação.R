### CARREGANDO PACOTES ###
pacman::p_load(car, gvlma, lm.beta, lmtest, MASS, sandwich)

### REGRESSÃO PRISÃO POR ASSALTO EM ESTADOS DO EUA - BASE USArrest
regUSArrests <- lm(Assault ~ ., data = USArrests) # ESTIMANDO A REGRESSÃO
summary(regUSArrests) # SUMÁRIO DA REGRESSÃO
lm.beta(regUSArrests) # COEFICIENTES PADRONIZADOS

# Stepwise #
regUSArrestsBack <- step(lm(Assault ~ ., data = USArrests), direction = 'backward') # de trás pra frente
summary(regUSArrestsBack)
regUSArrestsForw <- step(lm(Assault ~ ., data = USArrests), direction = 'forward') # do início pro fim
summary(regUSArrestsForw)
regUSArrestsBoth <- step(lm(Assault ~ ., data = USArrests), direction = 'both') # nos dois sentidos
summary(regUSArrestsBoth)

### VERIFICAÇÃO DOS PRESSUPOSTOS ###

# Possíveis outliers
boxplot(USArrests$Assault, USArrests$Murder, USArrests$Rape, names = c('Assault', 'Murder', 'Rape'), col = c('red', 'gray', 'gray'), main = 'Boxplot')

# normalidade dos resíduos
shapiro.test(residuals(regUSArrests))
plot(regUSArrests, which=1, col=c("blue")) # resíduos x ajuste
plot(regUSArrests, which=2, col=c("red")) # Q-Q Plot
plot(regUSArrests, which=5, col=c("blue"))  # Observações Influentes

#= Correção seria retirar as observações influentes = 
# =North Carolina, Rhoke Island, Georgia, Delaware, Hawaii#

# inflação da variância / multicolinearidade
vif(regUSArrests)
barplot(vif(regUSArrests), main = "VIF Values", horiz = FALSE, col = "steelblue", ylim = c(0,5))
abline(h = 5, lwd = 3, lty = 2)

#= Correção seria usar apenas uma das variáveis correlacionadas =#

# homocedasticidade (H0 = homocedasticidade)
bptest(regUSArrests) # teste de homocedasticidade
plot(regUSArrests, which=3, col=c("blue"))  # Scale-Location Plot

#= Correção seria usar estimativas robustas =#
regUSArrests$robse <- vcovHC(regUSArrests, type = "HC1")
coeftest(regUSArrests, regUSArrests$robse)

regRUSArrests <- rlm(Assault ~ . -UrbanPop, data = USArrests)
summary(regRUSArrests)
summary(regUSArrests)
