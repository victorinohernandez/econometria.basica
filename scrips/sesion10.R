### SESION 10 - TAREA
rm(list = ls())
library(readxl)
inflacion <- read_excel("data/DATA-ECONR-BAS-SESION 10-TAREA 1.1.xlsx")
View(inflacion)
serie <- ts(inflacion, start = c(1950,1), end=c(2015,1), frequency = 1)
library(dynlm)
# AUTOCORRELACION
#regresion
mod1.<-dynlm(inf~L(inf),data = inflacion)
summary(mod1.)
#prueba grafica
plot(mod1.)
#Prueba Durbin-Watson
library(lmtest)
dwtest(mod1.)

# prueba Ljung-Box
Box.test(mod1.$residuals, type = "Ljung-Box")
Box.test(residuals(mod1.), type = "Ljung-Box")
#Contraste de Breusch-Godfrey
bgtest(mod1.)

#Conclusion no hay autocorrelacion en ninguna de la pruebas ya que p-value es mayor a 0.05 por lo tanto se acepta la H0
