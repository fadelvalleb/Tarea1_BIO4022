### filtrado de datos para obtener columnas por orden y comparar su distribución
### espacial. Se importó la base de datos con el header modificado desde el .txt
### Luego se ejecuta el siguiente script para obtener Ordenes y distribución por Km2
### Se hizo además un filter por los valores mayores a 0 descartando aquellos negativos.
### esto hace que las obser

Homerange <- Pantheria_DB %>% select(MSW05_Order, X22.1_HomeRange_km2) %>% 
  group_by(MSW05_Order) %>% filter(X22.1_HomeRange_km2 > 0) %>% 
  rename(Orden=MSW05_Order, Distribución=X22.1_HomeRange_km2)

### Se cambiará el nombre de las columnas para que sean más lógicas con respecto
### al idioma usando rename


### se hará un summarise para ordenar los datos y obtener una media de
### la distribución

Mean_Homerange<-summarise(Homerange,  Distribución = mean(Distribución))

### acá se probará el tipo de gráfico a utilizar con las funciones de ggplot
### 


