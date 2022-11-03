# Este sera el codigo
#HOLA a
datos <- rio::import("Base/LEC 2022 Spring - Player Stats.csv")
require(ggplot2)
library(janitor)
library(stringr)
require(tidyverse)
require(gt)

datos$`W%` <-(  as.numeric(str_remove_all(datos$`W%`, "%"))) 

datos%>%
  filter(datos$`W%`>50)%>%
ggplot(aes(x= Player,y= `W%`))+
  geom_col(fill="green", col = "gray40" )+ coord_flip()

?ggplot

A <- c("variables","Player","w%","KDA","CSPM","GD10","KP")
B <- c("Descripcion","Nombre del jugador","Porcentajes de victorias respecto a las derrotas",
       "Puntaje calculado por la suma de los asesinatos + asistencias(ayudas de asesinatos), dividido por las muertes del jugador","Cantidad de minions cosechados por minuto",
       "diferencia de oro al minuto 10 respecto al rival","Porcentaje de participacion de asesinatos(Asesinatos+asistencias del jugador divido en el total de asesinatos del equipo)")
cbind(A,B)%>% 
  gt()
