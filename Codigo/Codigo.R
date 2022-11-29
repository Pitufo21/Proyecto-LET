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
  geom_col(fill="#BE95C4", col = "black" )+ coord_flip()+
  labs(x = "", y = "% de victorias", title = "Jugadores con el mejor winratio")+
  ggthemes::theme_base()+
  ggx::gg_("Center the title please")+
  theme(plot.subtitle = element_text(hjust = 0.5), 
       axis.text.x = element_text(size = 10),
       axis.text.y = element_text(size = 10),
)



Variables <- c("Player","w%","KDA","CSPM","GD10","KP")
Descripcion <- c("Nombre del jugador","Porcentajes de victorias respecto a las derrotas",
       "Puntaje calculado por la suma de los asesinatos + asistencias(ayudas de asesinatos), dividido por las muertes del jugador","Cantidad de minions cosechados por minuto",
       "diferencia de oro al minuto 10 respecto al rival","Porcentaje de participacion de asesinatos(Asesinatos+asistencias del jugador divido en el total de asesinatos del equipo)")
c <- cbind(Variables,Descripcion)%>%as.data.frame()%>%
  gt()


datos%>%
  filter(datos$KDA>5)%>%
  ggplot(aes(x= Player,y= KDA))+
  geom_col(fill="#9F86C0", col = "black" )+ coord_flip()+
  labs(x = "", y = " KDA", title = "Los 5 jugadores con mejor KDA")+
  ggthemes::theme_base()+
  ggx::gg_("Center the title please")+
  theme(plot.subtitle = element_text(hjust = 0.5), 
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
  )


datos%>%
  filter(datos$GD10>100)%>%
  ggplot(aes(x= Player,y= GD10))+
  geom_col(fill="#E0B1CB", col = "black" )+ coord_flip()+
  labs(x = "", y = "Diferencia de oro", title = "Diferencia de oro de los jugadores",subtitle = "Al minuto 10")+
  ggthemes::theme_base()+
  ggx::gg_("Center the title please")+
  theme(plot.subtitle = element_text(hjust = 0.5), 
        axis.text.x = element_text(size = 10),
        axis.text.y = element_text(size = 10),
  )

