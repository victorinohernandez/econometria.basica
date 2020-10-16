### SESION 05-TAREA
rm(list = ls())
library(haven)
puntajes <- read_dta("D:/CURSOS/Econometria Aplicada con R/Basico/Sesion 5. Graficos en R/Sesión 5 B - Archivos y tarea/01-ARCHIVOS UTILIZADOS-DATA/DATA-ECONR-BAS-SESION 5-TAREA 1.1.dta")
View(puntajes)
#Creando una variable y recodificando
library(Hmisc)
puntajes$tipo[puntajes$prog==1]<-"Programa académico"
puntajes$tipo[puntajes$prog==2]<-"Programa general"
puntajes$tipo[puntajes$prog==3]<-"Programa vocacional"

#Grafico de barras

barplot(table(puntajes$tipo), col="green", main="Programas académicos")


#Grafico de dispercion
plot(puntajes$read,puntajes$apt, pch=22, col="blue", main = "Relación entre el puntaje en lectura y calificación de aptitud", xlab = "Lectura",ylab = "Puntaje total")


# SESION 05 - EJEMPLOS
rm(list = ls())
library(haven)
sumaria_2015 <- read_dta("D:/CURSOS/Econometria Aplicada con R/Basico/Sesion 5. Graficos en R/Sesión 5 B - Archivos y tarea/01-ARCHIVOS UTILIZADOS-DATA/sumaria-2015.dta")

# Generando un avariable y recodificando
sumaria_2015$pobre [sumaria_2015$pobreza == 1] = "Pobre extremo"
sumaria_2015$pobre [sumaria_2015$pobreza == 2] = "Pobre no extremo"
sumaria_2015$pobre [sumaria_2015$pobreza == 3] = "No pobre"
#graficando 
pie(table(sumaria_2015$pobre), col = rainbow(4),
    main = "Porcentaje de hogares pobres")


## EJEMLO 02 GRAFICO DE BARRAS

#Etiquetas para estrato
sumaria_2015$estrat [sumaria_2015$estrato == 1] = "mayor de 100,000
viviendas"
sumaria_2015$estrat [sumaria_2015$estrato == 2] = "de 20,001 a 100,000
viviendas"
sumaria_2015$estrat [sumaria_2015$estrato == 3] = "de 10,001 a 20,000
viviendas"
sumaria_2015$estrat [sumaria_2015$estrato == 4] = "de 4,001 a 10,000
viviendas"
sumaria_2015$estrat [sumaria_2015$estrato == 5] = "de 401 a 4,000
viviendas"
sumaria_2015$estrat [sumaria_2015$estrato == 6] = "menos de 401
viviendas"
sumaria_2015$estrat [sumaria_2015$estrato == 7] = "Área de
empadronamiento rural - aer compuesto"
sumaria_2015$estrat [sumaria_2015$estrato == 8] = "Área de
empadronamiento rural - aer simple"


#GRAFICANDO
conteo<-table(sumaria_2015$estrat, sumaria_2015$pobre)
barplot (conteo, main="Condición de pobreza de acuerdo a estrato geográfico", beside=TRUE)


# HISTOGRAMA
m = mean(sumaria_2015$gashog2d)
std = sqrt(var(sumaria_2015$gashog2d))
hist(sumaria_2015$gashog2d, probability = TRUE, col="green",
     main = "Histograma del gasto total bruto",
     border = "grey")
curve(dnorm(x,mean = m, sd = std), col = "red",
      add = TRUE)

hist(sumaria_2015$gashog2d, probability = FALSE, col="red",
     main = "Histograma del gasto total bruto",
     border = "grey")

hist(sumaria_2015$gashog2d, probability = TRUE, col="blue",
     main = "Histograma del gasto total bruto")
lines(density(sumaria_2015$gashog2d),lwd=2.5, col="red")



# EJEMPLO 04 DISPERCION

plot(sumaria_2015$inghog1d, sumaria_2015$gashog2d, pch=22, main = "Dispersión entre ingresos y gastos")
