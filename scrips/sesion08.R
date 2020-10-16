### SESION 08 - TAREA
rm(list = ls())
library(haven)
gastos <- read_dta("data/DATA-ECONR-BAS-SESION 8-TAREA 1.1.dta")
View(gastos)
modelo <- lm(food_expend~income+hmembers+total_expend, data = gastos)
summary(modelo)
anova(modelo)
#Prueba de especifcacion
library(lmtest)
reset(modelo)
#Multicolinealidad
library(carData)
library(car)
attach(gastos)
#por matriz de correlaciones
cor(gastos[c("food_expend","income","hmembers","total_expend")], use="complete")
#por matriz de dispercion grafica
pairs(~food_expend+income+hmembers+total_expend)
# por VIF
vif(modelo)
