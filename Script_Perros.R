
###Se cargan las librerías necesarias
library(tidyverse)
library(ggplot2)

### Se lee el archivo de TXT descargado desde el directorio de trabajo
Pantheria_DB <- read.delim("~/Tarea1_BIO4022/Pantheria_DB.txt")

### Se filtran los datos por género canis y se ordenan las columnas en Kg,
### esto genera una tabla llamada Perros
Perros <- Pantheria_DB %>% select(MSW05_Genus, X5.1_AdultBodyMass_g, MSW05_Binomial) %>%
  group_by(MSW05_Genus) %>% filter(MSW05_Genus == "Canis") %>% 
  rename(Especie = MSW05_Binomial, Peso= X5.1_AdultBodyMass_g) %>% 
  mutate(Peso_en_Kg = Peso/1000)

### Versión Tidy de la tabla de Perros usando la función ungruop()
Perros_Tidy <- Perros %>% ungroup() %>% select(Especie,Peso_en_Kg)

### ggplot se usa para graficar los datos 
ggplot(Perros_Tidy, aes(Especie,Peso_en_Kg)) + 
  geom_point(alpha=0.5, color="Blue", size=4) + theme_grey() +ylab("Peso (Kg)")

