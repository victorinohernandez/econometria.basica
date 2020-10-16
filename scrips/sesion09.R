### SESION 09 - TAREA
rm(list = ls())
library(haven)
banco <- read_dta("data/DATA-ECONR-BAS-SESION 9-TAREA 1.1.dta")
View(banco)
attach(banco)
#Modelo
modelo<-lm(ingresos~edad+empleo+direccion, data = banco)
summary(modelo)
anova(modelo)
#Prueba de especifcacion
library(lmtest)
reset(modelo)
#Multicolinealidad
library(carData)
library(car)
#por matriz de correlaciones
cor(banco[c("ingresos","edad","empleo","direccion")], use="complete")
#por matriz de dispercion grafica
pairs(~ingresos+edad+empleo+direccion)
# por VIF
vif(modelo)
#HETEROSCEDASTICIDAD
bptest(modelo)
gqtest(modelo)
gqtest(modelo, order.by = ~ingresos, data=banco)
#por medio de graficos
plot(c(1:850),modelo$residuals,type = "l", xlab = "observaciones",ylab = "residuos")
plot(modelo$residuals^2,ingresos, xlab = "residuos", ylab = "var dep ingresos")

#NNORMALIDAD
plot(modelo)
d<-density(modelo$residuals)
plot(d,main='Residual KDE Plot',xlab='Residual value')
plot(ecdf(modelo$residuals))
#Shapiro HO=Normalidad H1= no Normalidad
shapiro.test(modelo$residuals)
#Jarque-Bera HO=Normalidad H1= no Normalidad
library(tseries)
jarque.bera.test(residuals(modelo))
jarque.bera.test(modelo$residuals)
