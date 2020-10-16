### SESION 07 TAREA

rm(list = ls())
setwd("D:/CURSOS/Econometria Aplicada con R/Basico/econometria.basica")
library(haven)
auto <- read_dta("data/DATA-ECONR-BAS-SESION 7-TAREA 1.1.dta")
View(auto)

library(lmtest)
# Modelo reg multiple
modelo <- lm(price~length+weight+trunk, data = auto)
summary(modelo)
anova(modelo)

#pueba de sobreidentificacion
reset(modelo)
# menor a 0.05 re rechaza la hipotesis Ho y el modelo esta sobreidentificado, forma funcional incorrecta