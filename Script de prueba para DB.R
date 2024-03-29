### se cargan las librerías necesarias para trabajar en el entorno

library(tidyverse)
library(ggplot2)

### A continuación se hace un filtrado de datos para obtener columnas por
### orden y comparar su distribución
### espacial. Se importó la base de datos con el header modificado desde el .txt
### Luego se ejecuta el siguiente script para obtener Ordenes y distribución por Km2
### Se hizo además un filter por los valores mayores a 1e01 Km^2
###  descartando aquellos negativos.



Homerange <- Pantheria_DB %>% select(MSW05_Order, X22.1_HomeRange_km2) %>% 
  group_by(MSW05_Order) %>% filter (MSW05_Order != "Cetacea") %>% 
  filter(X22.1_HomeRange_km2 > 1e02) %>% 

  rename(Orden=MSW05_Order, Distribución=X22.1_HomeRange_km2)

### Se cambiará el nombre de las columnas para que sean más lógicas con respecto
### al idioma usando rename


### se hará un summarise para ordenar los datos y obtener una media de
### la distribución

Mean_Homerange<-summarise(Homerange,  Distribución = mean(Distribución)) %>% 
  filter(Distribución != "NaN")

### acá se probará el tipo de gráfico a utilizar con las funciones de ggplot

ggplot(Mean_Homerange, aes(x=Orden,y=Distribución)) + geom_point()

