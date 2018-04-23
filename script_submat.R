#Escribe un script de R que haga y responda lo siguiente:

#1) Carga en una df llamada fullmat el archivo Prac_Uni7/maices/meta/maizteocintle_SNP50k_meta_extended.txt.
fullmat<-read.delim("../meta/maizteocintle_SNP50k_meta_extended.txt")

#2) ¿Qué tipo de objeto creamos al cargar la base?
class(fullmat)

#3) ¿Cómo se ven las primeras 6 líneas del archivo?
head(fullmat)

#4) ¿Cuántas muestras hay?
str(fullmat)
#Número de muestras 165

#5)¿De cuántos estados se tienen muestras?
str(fullmat$Estado)
#19 estados

#6)¿Cuántas muestras fueron colectadas antes de 1980?
menos1980<-subset(fullmat, fullmat$A.o._de_colecta < 1980)
str(menos1980)
#8 muestras

#7)¿Cuántas muestras hay de cada raza?
table(fullmat$Raza)

#8) En promedio ¿ a qué altitud fueron colectadas las muestras?
#Primero cargamos la librería dplyr
library(dplyr)
summarise(fullmat,mean(Altitud))
#Media de 1519 m.

#9)¿Y a qué altitud máxima y mínima fueron colectadas?
summarise(fullmat,max (Altitud),min (Altitud))
#Máxima 2769m, mínima 5m.

#10) Crea una nueva df de datos sólo con las muestras de la raza Olotillo
olotillo<-subset(fullmat, fullmat$Raza=="Olotillo")

#11) Crea una nueva df de datos sólo con las muestras de la raza Reventador, Jala y Ancho.

#Primero hacemos un df para cada raza con el comando subset():
reventador<-subset(fullmat, fullmat$Raza == "Reventador")
jala<-subset(fullmat, fullmat$Raza == "Jala")
ancho<-subset(fullmat,fullmat$Raza == "Ancho")
#Creamos el df con el comando dplyr::bind_rows
submat<-bind_rows(reventador, jala, ancho)

#12) Escribe la matriz anterior a un archivo llamado "submat.cvs" en/meta.
write.csv(submat, file = "../meta/submat.cvs")

