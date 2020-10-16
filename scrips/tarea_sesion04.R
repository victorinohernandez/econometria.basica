### SESION 04-TAREA

rm(list = ls())
library(haven)
inversion <- read_dta("D:/CURSOS/Econometria Aplicada con R/Basico/Sesion 4. Gestion de datos/Sesión 4 B - Archivos y tarea/01-ARCHIVOS UTILIZADOS-DATA/DATA-ECONR-BAS-SESION 4-TAREA 1.1.dta")
View(inversion)

# Crear etiquetas a las variable
# instalar el paquete Hmisc
library(Hmisc)
label(inversion$capital)<-"inversión en capital"
label(inversion$labor)<-"inversión en mano de obra"
label(inversion$lnoutput)<-"logaritmo de la producción"

#Crear una variable
inversion$produccion<-with(inversion,exp(lnoutput))
label(inversion$produccion)<-"producción en forma lineal"

#Renombrar variables
#instalar el paquete reshape
library(reshape)
inversion<-rename(inversion,c(capital="Capital"))
inversion<-rename(inversion,c(labor="Labor"))
inversion<-rename(inversion,c(produccion="Producción"))
